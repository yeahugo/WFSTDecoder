//
//  FeatureDecoder.c
//  AudioDecoder
//
//  Created by dandanniao on 13-9-8.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "WFSTDecoder.h"

#include "assert.h"

#define GET_TOKENID(token) (int)(token - _tokenManager.tokenList)

NETWORK _network;
TokenManager _tokenManager;
HypTextManager _hypTextManager;
Translation _forkTranslation;

//for debug============

#include <map>
#include <string>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;
//==================

void initHypText()
{
    int i;
    _hypTextManager.hypTextList = (HypText *)malloc(sizeof(HypText) * MAX_HYP_NUM);
    _hypTextManager.freeHead = 0;
    _hypTextManager.usedNum = 0;
    for (i = 0; i < MAX_HYP_NUM - 1; i++) {
        _hypTextManager.hypTextList[i].nextFree = i + 1;
        _hypTextManager.hypTextList[i].ref_count = 0;
        _hypTextManager.hypTextList[i].wordNum = 0;
    }
    _hypTextManager.hypTextList[i].wordNum = 0;
    _hypTextManager.hypTextList[i].nextFree = -1;
    _hypTextManager.hypTextList[i].ref_count = 0;
}

int getNewHypText() {
    int newHypID = _hypTextManager.freeHead;
    if (newHypID < 0) {
        printf("##failed to get new HypText!!!!!!!!!!\n");
        return -1;
    }
    _hypTextManager.freeHead = _hypTextManager.hypTextList[newHypID].nextFree;
    HypText* newHypText = &_hypTextManager.hypTextList[newHypID];
    newHypText->ref_count = 1;
    newHypText->wordNum = 0;
    _hypTextManager.usedNum++;
	assert(_hypTextManager.usedNum <= MAX_HYP_NUM);
    return newHypID;
}

int cloneHypText(int src_word_id,int create) {
    int newHypID = src_word_id;
	assert(_hypTextManager.hypTextList[newHypID].ref_count > 0);
    if (create) {
        newHypID = getNewHypText();
        assert(src_word_id >= 0);
        assert(newHypID >= 0);
        assert(newHypID != src_word_id);
        HypText* src = &_hypTextManager.hypTextList[src_word_id];
        HypText* tgt = &_hypTextManager.hypTextList[newHypID];
        tgt->wordNum = src->wordNum;
		assert(src->wordNum < MAX_RESULT_WORD_NUM);
        memcpy(tgt->words,src->words,tgt->wordNum * sizeof(int));
		//For Debugs
		memcpy(tgt->hmms,src->hmms,tgt->wordNum * sizeof(int));
    } else {
        _hypTextManager.hypTextList[newHypID].ref_count++;
    }
    return newHypID;
}

int returnHypText(int hypTextId) {
    HypText* hypText = &_hypTextManager.hypTextList[hypTextId];
    assert(hypText->ref_count > 0);
    if (--hypText->ref_count == 0) {
        hypText->nextFree = _hypTextManager.freeHead;
		_hypTextManager.freeHead = hypTextId;
        hypText->wordNum = 0;
        hypText->ref_count = 0;
        _hypTextManager.usedNum--;
		if (_hypTextManager.usedNum <= 0) {
			printf("########token used num:%d\n",_tokenManager.usedTokenNum);
		}
		assert(_hypTextManager.usedNum > 0);
    }
    return 0;
}

int extendHypText(int hypTextId, int wordID)
{
    HypText* hypeText = &_hypTextManager.hypTextList[hypTextId];
	assert(hypeText->ref_count > 0);
    if (hypeText->wordNum > MAX_RESULT_WORD_NUM - 1) {
        printf("##hypText is too long.\n");
        return -1;
    }

    *(hypeText->words + hypeText->wordNum) = wordID;
    hypeText->wordNum++;

    return 0;
}

int getNewToken()
{
    int newTokenId = -1;
    if (_tokenManager.usedTokenNum > MAX_TOKEN_NUM - 1) {
        cutOffToken();
    }

    if (_tokenManager.usedTokenNum < MAX_TOKEN_NUM) {
        newTokenId = _tokenManager.freeHead;
        Token* newToken = &_tokenManager.tokenList[newTokenId];
        _tokenManager.freeHead = newToken->next;
		if (_tokenManager.curToken == -1) {
			newToken->next = -1;
			_tokenManager.useHead = newTokenId;
		} else {
			Token* curToken = &_tokenManager.tokenList[_tokenManager.curToken];
			newToken->next = curToken->next;
			curToken->next = newTokenId;
		}
        _tokenManager.usedTokenNum++;
        newToken->amScore = 0;
        newToken->lmScore = 0;
        newToken->totalScore = 0;
        newToken->hmmStateID = 0;
		newToken->wordListID = -1;
    }
    assert(newTokenId >= 0);
    return newTokenId;
}

void returnToken(Token* token,Token* preToken)
{
    int tokenID = GET_TOKENID(token);
    if (tokenID == _tokenManager.useHead) {
        _tokenManager.useHead = token->next;
    } else {
        if (!preToken) {
            preToken = getPreToken(tokenID);
        }
        assert(preToken->next == tokenID);
        preToken->next = token->next;
    }
    returnHypText(token->wordListID);
    token->next = _tokenManager.freeHead;
    _tokenManager.freeHead = tokenID;
    _tokenManager.usedTokenNum--;
}

float getTotalScore(float amScore, float lmScore)
{
    float totalScore = amScore * AM_WEIGHT + lmScore ;
    return totalScore;
}

Token* getPreToken(int tokenID) {
    Token* token = &_tokenManager.tokenList[_tokenManager.useHead];
    while (token->next != -1) {
        if (token->next == tokenID) {
            return token;
        }
        token = &_tokenManager.tokenList[token->next];
    }
    return NULL;
}

float calCutOffThreshold(float lowB,float upB,int num)
{
  float deltaTokens = 0;
  float threshHoldValue = lowB;
  Token *token = NULL;
  Token *nextToken = NULL;
  int i;
  int tokenGroupIndex = 0;
  int leftTotalNum = 0;
  int  tokenGroupNum[CUT_OFF_GROUP_NUM + 1];
  memset(tokenGroupNum, 0, (CUT_OFF_GROUP_NUM + 1)*sizeof(int));
  if(upB - lowB < 1e-7) {
    return lowB;
  }
  
  deltaTokens = (upB - lowB)/CUT_OFF_GROUP_NUM;
  assert(_tokenManager.usedTokenNum > num);
  token = &_tokenManager.tokenList[_tokenManager.useHead];
  while (token) {
  	if (token->next != _tokenManager.curToken) {
	  nextToken = &_tokenManager.tokenList[token->next];
    } else {
	  nextToken = NULL;
    }
    if (token->totalScore < lowB || token->totalScore > upB) {
	  token = nextToken;
	  continue;
    }
    tokenGroupIndex = (token->totalScore - lowB)/deltaTokens;
    if (tokenGroupIndex <= CUT_OFF_GROUP_NUM && tokenGroupIndex >= 0) {
      tokenGroupNum[tokenGroupIndex]++;
    } else {
      printf("###invalid index:%d,score:%f,lowB:%f,upB:%f\n",tokenGroupIndex,token->totalScore,lowB,upB);
    }
	token = nextToken;
  }

  leftTotalNum = 0;
  for(i = 10;i >= 0;i--) {
    leftTotalNum += tokenGroupNum[i];
    if (leftTotalNum > num) {
      break;
    }
  }
  if ( i <= 0) {
    i++;
  }
  if (leftTotalNum - tokenGroupNum[i] < MIN_ACTIVE_TOKEN_NUM) {
    threshHoldValue = calCutOffThreshold(lowB + i*deltaTokens,lowB + (i + 1)*deltaTokens,num + tokenGroupNum[i] - leftTotalNum);
  } else {
    threshHoldValue = lowB + (i + 1)*deltaTokens;
  }
  return threshHoldValue;
}

void returnTokensByThreshhold(int begin,int end,float threshold) {
    assert(begin != end);
    Token* preToken = NULL;
    Token* token = &_tokenManager.tokenList[begin];
    Token* nextToken = NULL;
    while (token != NULL) {
        if (token->next != end) {
            nextToken = &_tokenManager.tokenList[token->next];
        } else {
            nextToken = NULL;
        }
        if (token->totalScore < threshold) {
			assert(&_hypTextManager.hypTextList[token->wordListID].ref_count >0);
            returnToken(token, preToken);
        } else {
            preToken = token;
        }
        token = nextToken;
    }
}

void returnTokensForce(int count) {
	assert(_tokenManager.usedTokenNum > MAX_ACTIVE_TOKEN_NUM);
	assert(_tokenManager.usedTokenNum - count > MIN_ACTIVE_TOKEN_NUM);
    Token* token = &_tokenManager.tokenList[_tokenManager.useHead];
    Token* nextToken = NULL;
    while (token->next != -1 && count > 0) {
        nextToken = &_tokenManager.tokenList[token->next];
        returnToken(token, NULL);
        token = nextToken;
        count--;
    }
}

void cutOffTokenByTotalScore(int maxTokenNum)
{
    float threshHoldValue = calCutOffThreshold(_tokenManager.worstTotalScore,_tokenManager.bestTotalScore,maxTokenNum);
    returnTokensByThreshhold(_tokenManager.useHead,_tokenManager.curToken,threshHoldValue);
    _tokenManager.worstTotalScore = threshHoldValue;
    if(_tokenManager.usedTokenNum >= MAX_TOKEN_NUM) {
        returnTokensForce(1);
    }
}

void cutoffTokenByHmmScore() {
    assert(_tokenManager.useHead >= 0);
    Token* preToken = NULL;
    Token* token = &_tokenManager.tokenList[_tokenManager.useHead];
    Token* nextToken = NULL;
    while(token != NULL) {
        if (token->next != _tokenManager.curToken) {
            nextToken = &_tokenManager.tokenList[token->next];
        } else {
            nextToken = NULL;
        }

        if (token->hmmStateID < 0 || token->totalScore <= LOG_ZERO) {
            returnToken(token, preToken);
        } else if (token->hmmStateID > 0 &&
            token->hmmStateID <= EMIT_STATE_NUM &&
            token->totalScore < _tokenManager.hmmMaxScores[token->wordListID].max_score[token->hmmStateID - 1]) {
            returnToken(token, preToken);
        } else {
            preToken = token;
        }
        token = nextToken;
    }
}


int initFirstToken()
{
    _tokenManager.curToken = -1;
	int initTokenId = getNewToken();
    Token* initToken = &_tokenManager.tokenList[initTokenId];
    initToken->wordListID = getNewHypText();
    assert(initToken->wordListID != -1);
    _forkTranslation.toStateID = 0;
    _forkTranslation.hmmID = 10;
    _forkTranslation.weight = 0;
    _forkTranslation.wordID = 0;
    initToken->translation = &_forkTranslation;
    initToken->amScore = 0;
    initToken->lmScore = 0;
    initToken->totalScore = 0;
    initToken->hmmStateID = 4;
    return 0;
}

void initTokenManager()
{
    int i;
    _tokenManager.tokenList = (Token*) malloc(sizeof(Token) * MAX_TOKEN_NUM);
    for(i=0;i < MAX_TOKEN_NUM;i++) {
        _tokenManager.tokenList[i].next = i + 1;
        _tokenManager.tokenList[i].wordListID = -1;
        _tokenManager.tokenList[i].lmScore = 0;
        _tokenManager.tokenList[i].amScore = 0;
        _tokenManager.tokenList[i].totalScore = 0;
        _tokenManager.tokenList[i].translation = NULL;
    }
    _tokenManager.tokenList[MAX_TOKEN_NUM-1].next = -1;
    _tokenManager.freeHead = 0;
    _tokenManager.useHead = -1;
    _tokenManager.hmmMaxScores = (TokenHmmMaxScores*) malloc(sizeof(TokenHmmMaxScores) * MAX_HYP_NUM);

    initFirstToken();
}

void initHmmMaxScores() {
    float* tmp = (float*)_tokenManager.hmmMaxScores;
    for(int i = 0; i < MAX_HYP_NUM * EMIT_STATE_NUM;i++) {
        *(tmp + i) = LOG_ZERO;
    }
}

void initScoreBounds()
{
    _tokenManager.bestAmScore = FLT_MIN;
    _tokenManager.worstAmScore = FLT_MAX;
    _tokenManager.bestLmScore = FLT_MIN;
    _tokenManager.worstLmScore = FLT_MAX;
    _tokenManager.bestTotalScore = FLT_MIN;
    _tokenManager.worstTotalScore = FLT_MAX;
    initHmmMaxScores();
}

int initWFSTDecoder(const char * hmmfile, const char *transfile, const char * wordIDmapfile) {
    if(0 != init(&_network, hmmfile, transfile, wordIDmapfile) ){
        printf("init network error!");
        return -1;
    }
    initHypText();
    initTokenManager();
    return 0;
}

int cutOffToken()
{
    cutoffTokenByHmmScore();

    if (_tokenManager.usedTokenNum > MAX_ACTIVE_TOKEN_NUM) {
        cutOffTokenByTotalScore(MAX_ACTIVE_TOKEN_NUM);
    }

    return 0;
}

void updateTokenHmmMaxScore(Token* token) {
    if (token->hmmStateID < 1 || token->hmmStateID > EMIT_STATE_NUM + 1) {
        return;
    }
    if(token->totalScore > _tokenManager.hmmMaxScores[token->wordListID].max_score[token->hmmStateID - 1]) {
        _tokenManager.hmmMaxScores[token->wordListID].max_score[token->hmmStateID - 1] = token->totalScore;
    }
}

void updateAmBoundScores(Token *token)
{
	if (token->hmmStateID <= 0 || 
		token->hmmStateID > EMIT_STATE_NUM || 
		token->hmmStateID == 2 && IS_SPHMM(token->translation->hmmID)) {
		return;
	}
	
	if (token->amScore > _tokenManager.bestAmScore) {
        _tokenManager.bestAmScore = token->amScore;
    }

    if (token->amScore < _tokenManager.worstAmScore) {
        _tokenManager.worstAmScore = token->amScore;
    }

    if (token->totalScore > _tokenManager.bestTotalScore) {
        _tokenManager.bestTotalScore = token->totalScore;
    }

    if (token->totalScore < _tokenManager.worstTotalScore) {
        _tokenManager.worstTotalScore = token->totalScore;
    }

    updateTokenHmmMaxScore(token);
}

int HmmCopyMoveToken(Feature *oneFeature, Token *token, int toHmmStateID)
{
    int newTokenID = getNewToken();
    Token *newToken = &_tokenManager.tokenList[newTokenID];
    newToken->hmmStateID = toHmmStateID;
    newToken->translation = token->translation;
    newToken->lmScore = token->lmScore;
    newToken->wordListID = cloneHypText(token->wordListID, 0);
    int hmmID = newToken->translation->hmmID;
    real hmmScore = getFrameScore(&_network, oneFeature->data, hmmID, token->hmmStateID, toHmmStateID);
    newToken->amScore = token->amScore + hmmScore;
    newToken->totalScore = getTotalScore(newToken->amScore,newToken->lmScore);
    updateAmBoundScores(newToken);
    return newTokenID;
}

int HmmSpinToken(Feature *oneFeature, Token *token)
{
    Translation *translation = token->translation;
    assert(translation->hmmID > 0);
    assert( token->hmmStateID >=0 &&  token->hmmStateID <=5);
	real hmmScore = getFrameScore(&_network, oneFeature->data, translation->hmmID, token->hmmStateID, token->hmmStateID);
    token->amScore = token->amScore + hmmScore;
    token->totalScore = getTotalScore(token->amScore,token->lmScore);
    updateAmBoundScores(token);
    return 0;
}

int HmmMoveToken(Feature *oneFeature, Token *token, int toHmmStateID)
{
    int hmmID = token->translation->hmmID;
    int sourceStateID = token->hmmStateID;
    real hmmScore = getFrameScore(&_network, oneFeature->data, hmmID, sourceStateID, toHmmStateID);
    token->amScore += hmmScore;
    token->hmmStateID = toHmmStateID;
    token->totalScore = getTotalScore(token->amScore,token->lmScore);
    updateAmBoundScores(token);
    return 0;
}

int passTokenInLM(Feature *oneFeature, Token *token)
{
	assert(_hypTextManager.hypTextList[token->wordListID].ref_count > 0);
	Translation *translation = token->translation;
    int stateID = translation->toStateID;
    int transIndex = 0;
    Translation * toTranslations = NULL;
    int translationCount = getTranslationIDs(&_network, stateID, &toTranslations);
    if (translationCount < 0) {
        printf("failed to get translations for token.\n");
        return -1;
    }

    if (translationCount > MAX_TRANSLATION_NUM) {
        translationCount = MAX_TRANSLATION_NUM;
    }
    for (transIndex = 0; transIndex < translationCount; transIndex++){
        Translation * cur_trans = toTranslations + transIndex;
        int newTokenID = getNewToken();
		assert(_hypTextManager.hypTextList[token->wordListID].ref_count > 0);
        assert(newTokenID >= 0);
        Token * newToken = &_tokenManager.tokenList[newTokenID];
        int newHypeTextId = cloneHypText(token->wordListID, 1);
        assert(newHypeTextId >= 0);
		
		//debug
		HypText* newHypeText = &_hypTextManager.hypTextList[newHypeTextId];
		newHypeText->hmms[newHypeText->wordNum] = cur_trans->hmmID;

		extendHypText(newHypeTextId, cur_trans->wordID);
		
        newToken->wordListID = newHypeTextId;

        newToken->translation = cur_trans;
        newToken->lmScore = token->lmScore + cur_trans->weight;
        newToken->amScore = token->amScore;
        newToken->totalScore = getTotalScore(newToken->amScore,newToken->lmScore);
        newToken->hmmStateID = 0;
		if (cur_trans->wordID != 0) {
			newToken->lmScore -= 2;
		}
        if (cur_trans->hmmID == EPS_HMMID) {
            passTokenInLM(oneFeature, newToken);
			//newToken->lmScore -= 4;
        } else {
            passTokenInAM(oneFeature,newToken,IS_SPHMM(translation->hmmID));
        }
    }
    token->hmmStateID = -1;;
    return 0;
}

int passTokenInAM(Feature * oneFeature, Token *token,int isPreSp)
{
    int hmmStateID = token->hmmStateID;
    int hmmID = token->translation->hmmID;
    if (IS_SILHMM(hmmID)) {
          switch(hmmStateID) {
            case 0: {
                HmmMoveToken(oneFeature, token, 1);
                break;
            }
            case 1: {
                HmmCopyMoveToken(oneFeature, token, 2);
                HmmCopyMoveToken(oneFeature, token, 3);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 2: {
                HmmCopyMoveToken(oneFeature, token, 3);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 3: {
                HmmCopyMoveToken(oneFeature, token, 1);
                int newTokenID = HmmCopyMoveToken(oneFeature, token,4);
                passTokenInLM(oneFeature,&_tokenManager.tokenList[newTokenID]);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 4: {
                passTokenInLM(oneFeature,token);
                break;
            }
            default: {
                break;
            }
         }
    } else if (IS_SPHMM(hmmID)){
        switch(hmmStateID) {
            case 0: {
                if (!isPreSp) {
                    HmmCopyMoveToken(oneFeature, token, 1);
                    HmmMoveToken(oneFeature, token, 2);
                    if (passTokenInLM(oneFeature, token) != 0){
                        printf("failed to move token in sp.\n");
                        return -1;
                    }
                } else {
                    HmmMoveToken(oneFeature, token, 1);
                }
                break;
            }
            case 1: {
                int newTokenID = HmmCopyMoveToken(oneFeature, token,2);
                passTokenInLM(oneFeature,&_tokenManager.tokenList[newTokenID]);;
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 2: {
                passTokenInLM(oneFeature,token);
                break;
            }
            default: {
                break;
            }
        }
    } else {
        switch (hmmStateID) {
            case 0:{
                HmmMoveToken(oneFeature, token, 1);
                break;
            }
            case 1:
            {
                HmmCopyMoveToken(oneFeature, token, 2);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 2:{
                HmmCopyMoveToken(oneFeature, token, 3);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 3:{
                int newTokenID = HmmCopyMoveToken(oneFeature, token,4);
                passTokenInLM(oneFeature,&_tokenManager.tokenList[newTokenID]);
                HmmSpinToken(oneFeature, token);
                break;
            }
            case 4: {
                passTokenInLM(oneFeature,token);
                break;
            }
            default:{
                break;
            }
        }
    }
    return 0;
}


int  ProcessSingleFrame(Feature * oneFeature)
{
    assert(_tokenManager.usedTokenNum > 0);
    Token *token = &_tokenManager.tokenList[_tokenManager.useHead];
    _tokenManager.curToken = _tokenManager.useHead;
    int count = 0;
    Token* nextToken = NULL;
    while (token) {
        count++;
        if (token->next != -1) {
            nextToken = &_tokenManager.tokenList[token->next];
        } else {
            nextToken = NULL;
        }
        if (passTokenInAM(oneFeature,token,0) != 0) {
            printf("failed to pass token in hmmstate.\n");
            return -1;
        }
		_tokenManager.curToken = token->next;
        token = nextToken;
    }
    return 0;
}

int processFeatures(Feature * feature,int featureNum)
{
    if (!feature || featureNum <= 0) {
          printf("invalid parameters in processFeature\n");
          return -1;
    }

    int frameCount = 0;
    for (int i = 0;i < featureNum; i++) {
       initScoreBounds();
       if (ProcessSingleFrame(feature + i) != 0) {
            printf("failed to process the %d frame\n",i);
            return -1;
       }
       cutOffToken();
	   if (frameCount % 50 == 0) {
	       printSortHypText(frameCount);
	   }
	   frameCount ++;
       printf("frameCount:%d token used:%d hyptext used: %d\n",frameCount,_tokenManager.usedTokenNum,_hypTextManager.usedNum);
    }
	
    printSortHypText(frameCount);

    return 0;
}

int getResult(char* buf)
{
	assert(_tokenManager.usedTokenNum > 0);
	Token* bestToken = NULL;
	Token* token = &_tokenManager.tokenList[_tokenManager.useHead];
	Token* nextToken = NULL;
	float lastScore = 0;
	float bestScore = FLT_MIN;
	while(token) {
		if(token->next != -1) {
			nextToken = &_tokenManager.tokenList[token->next];
		} else {
			nextToken = NULL;
		}
		assert(token->translation != NULL);
		if (token->hmmStateID < 0) {
			token = nextToken;
			continue;
		}

		/*if (token->hmmStateID == EMIT_STATE_NUM) {
			if(IS_SILHMM(token->translation->hmmID)) {
				lastScore = getSilHmmTransScore(&_network,token->translation->hmmID,EMIT_STATE_NUM,EMIT_STATE_NUM + 1);
			} else {
				lastScore = getHmmTransScore(&_network,token->translation->hmmID,EMIT_STATE_NUM,EMIT_STATE_NUM + 1);
			}
			token->totalScore += lastScore;
		} else if (IS_SPHMM(token->translation->hmmID)) {
			assert(token->hmmStateID == 1);
			lastScore = getSpHmmTransScore(&_network,token->translation->hmmID,token->hmmStateID,2);
			token->totalScore += lastScore;
		} else {
		    assert(token->hmmStateID == 1||token->hmmStateID == 2||token->hmmStateID == 3);
			token->totalScore += AM_PUNISH_SCORE;
		}*/
		
		if (token->totalScore > bestScore) {
			bestScore = token->totalScore;
			bestToken = token;
		}
		token = nextToken;
	}
	assert(bestToken != NULL);
	int result_len = -1;
    int wordListID = bestToken->wordListID;
	printf("######wordListID:%d\n",wordListID);
    HypText *hypText = &_hypTextManager.hypTextList[wordListID];
    getTextsByWordIds(&_network, hypText->words, hypText->wordNum, buf, &result_len);
    return result_len;
}


//========================================================================================

void printTokenList()
{
    Token *usedToken = &_tokenManager.tokenList[_tokenManager.useHead];
    int usedCount = 0;
    while (usedToken->next != -1) {
        usedCount++;
        Token* nextToken = &_tokenManager.tokenList[usedToken->next];
        if (usedToken->next != -1) {
            usedToken = nextToken;
        } else {
            break;
        }
    }
    printf("used after count is %d usedNum is %d\n",usedCount,_tokenManager.usedTokenNum);

    Token *freeToken = &_tokenManager.tokenList[_tokenManager.freeHead];
    int freeCount = 0;
    while (freeToken->next != -1) {
        freeCount++;
        Token* nextToken = &_tokenManager.tokenList[freeToken->next];
        if (freeToken->next != -1) {
            freeToken = nextToken;
        } else {
            break;
        }
    }

    printf("--free after count is %d\n",freeCount);
}

void checkTokenBound()
{
    int totalCount = 0;
    int boundTotalCount = 0;
    Token *token = &_tokenManager.tokenList[_tokenManager.useHead];
    while (token) {
        totalCount++;
//        assert(token->totalScore <= _tokenManager.bestTotalScore && token->totalScore >= _tokenManager.worstTotalScore);
        if (token->totalScore <= _tokenManager.bestTotalScore && token->totalScore >= _tokenManager.worstTotalScore) {
            boundTotalCount++;
            //            printf("tokenScore is %f\n",token->totalScore);
        }
        else{
            printf("id is %d score is %f token in out of bound best is %f worst is %f\n",GET_TOKENID(token),token->totalScore,_tokenManager.bestTotalScore,_tokenManager.worstTotalScore);
            //printHypText();
            //exit(-1);
        }
        token = (token->next != -1) ? &_tokenManager.tokenList[token->next]:NULL;
    } ;
    assert(totalCount == _tokenManager.usedTokenNum);
    assert(boundTotalCount >= _tokenManager.usedTokenNum - 1 && boundTotalCount <= _tokenManager.usedTokenNum);
}

void printHypText()
{
    FILE *file;
    char * fileName = "output.txt";
    file = fopen(fileName, "wb");

    Token *token = &_tokenManager.tokenList[_tokenManager.useHead];
    while (token) {
        char buf[1024];
        int wordListID = token->wordListID;
        HypText *hypText = &_hypTextManager.hypTextList[wordListID];
        int result_len = 0;
        float totalScore = token->totalScore;

        char scoreBuf[10240];
        getTextsByWordIds(&_network, hypText->words, hypText->wordNum, buf, &result_len);
        buf[result_len] = '\0';
        int length = sprintf(scoreBuf, "totalScore is %f, lmScore is %f, amScore is %f, result is %s,num %d,ref:%d,wordlistid:%d \n",totalScore,token->lmScore,token->amScore,buf,hypText->wordNum,hypText->ref_count,wordListID);

        fwrite(scoreBuf, 1, length, file);

        if (token->next != -1) {
            token = &_tokenManager.tokenList[token->next];
        } else {
            token = NULL;
        }
    }
}

typedef pair<int,int> PAIR;  
int cmp(const PAIR& x, const PAIR& y)  
{  
	Token t1 = _tokenManager.tokenList[x.second];
	Token t2 = _tokenManager.tokenList[y.second];
	return t1.totalScore> t2.totalScore;  
}  

string getHmmSeqByid(int* ids,int num);

void printSortHypText(int frameNum)
{
    FILE *file;
	char fileName[1024];
	snprintf(fileName,1024,"output/output_%d.txt",frameNum);
    file = fopen(fileName, "wb");

    Token *token = &_tokenManager.tokenList[_tokenManager.useHead];
	map<int,int> hypidAndTokenMap;
    while (token) {
        int wordListID = token->wordListID;
        float totalScore = token->totalScore;
		if (hypidAndTokenMap.count(wordListID) == 0) {
			hypidAndTokenMap[wordListID] = GET_TOKENID(token);
		} else {
			Token tmpToken = _tokenManager.tokenList[hypidAndTokenMap[wordListID]];
			if (tmpToken.totalScore < token->totalScore) {
				hypidAndTokenMap[wordListID] = GET_TOKENID(token);
			}
		}

        if (token->next != -1) {
            token = &_tokenManager.tokenList[token->next];
        } else {
            token = NULL;
        }
    }
 
	vector<PAIR> vec;  
	for (map<int,int>::iterator curr = hypidAndTokenMap.begin(); curr != hypidAndTokenMap.end(); ++curr)  
	{  
	    vec.push_back(make_pair(curr->first, curr->second));  
	}  
	sort(vec.begin(), vec.end(), cmp);
	vector<PAIR>::iterator it = vec.begin();
	while(it != vec.end()) {
		int wordListID = it->first;
        HypText *hypText = &_hypTextManager.hypTextList[wordListID];
        int result_len = 0;
		char scoreBuf[10240];
		char buf[1024];
		getTextsByWordIds(&_network, hypText->words, hypText->wordNum, buf, &result_len);
		buf[result_len] = '\0';
		Token tmpToken = _tokenManager.tokenList[hypidAndTokenMap[wordListID]];
		string hmmseq = getHmmSeqByid(hypText->hmms,hypText->wordNum);
		int length = sprintf(scoreBuf, "result:%s,hmmseq:%s,totalScore:%f,amScore:%f,lmScore:%f,hmmind:%d,hypId:%d,num:%d,ref:%d\n",buf,hmmseq.c_str(),tmpToken.totalScore,tmpToken.amScore,tmpToken.lmScore,tmpToken.translation->hmmID,wordListID,hypText->wordNum,hypText->ref_count);
		fwrite(scoreBuf, 1, length, file);
		it++;
	}
	
}


string getHmmSeqByid(int* ids,int num) {
	string strfile = "./data/final.insyms";
	ifstream fin;
	fin.open(strfile.c_str());
	if (!fin.is_open()) {
		printf("##failed to open map file.\n");
	}
	static map<int,string> idAndNameMap;
	static bool isload = false;
	string strline;
	while(!fin.eof() && !isload) {
		getline(fin,strline);
		int index = strline.find(' ');
		string name = strline.substr(0,index);
		index = strline.rfind(' ');
		int id = atoi(strline.substr(index + 1).c_str());
		assert(id >=0);
		if (name.empty()) {
			continue;
		}
		assert(!name.empty());
		idAndNameMap[id] = name;
	}
	isload = true;
	assert(idAndNameMap.size() ==  35191);
	string strResult;
	for(int i = 0;i < num;i++) {
		if (idAndNameMap.count(ids[i]) != 0) {
			strResult.append(idAndNameMap[ids[i]]);
			strResult.append("|");
		} else {
			printf("###no map for id:%d\n",ids[i]);
		}
	}
	return strResult;
}

