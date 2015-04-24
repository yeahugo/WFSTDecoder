//
//  WFSTDecoder.h
//  Created by dandanniao on 13-9-8.
//  Copyright (c) 2013年 Ai. All rights reserved.

#ifndef WFSTDECODER_H__
#define WFSTDECODER_H__

#include "defines.h"
#include "Model.h"
#include "PcDataFormat.h"


typedef struct {
    float data[FEATURE_DIM];
}Feature;

int initWFSTDecoder(const char * hmmfile, const char *transfile, const char * wordIDmapfile);
int processFeatures(Feature *features,int featureNum);
int getResult(char* buf);// buf should be preallocated,return value is the result len


//=========================================================================

typedef struct
{
    Translation * translation;
    int     wordListID;
    int     hmmStateID;
    float   lmScore; // 当前路径语言模型得分之和
    float   amScore; // 当前路径声学模型的得分之和
    float   totalScore;  //  声学模型和语言模型总得分
    int     next; // 下一个tokenID
}Token;

typedef struct TokenHmmMaxScores {
    float max_score[EMIT_STATE_NUM];
}TokenHmmMaxScores;

typedef struct {
    int freeHead;
    int useHead;
    int curToken;
    float bestAmScore;
    float worstAmScore;
    float bestLmScore;
    float worstLmScore;
    int usedTokenNum;
    float bestTotalScore;
    float worstTotalScore;
    Token *tokenList;
    TokenHmmMaxScores* hmmMaxScores;
}TokenManager;

typedef struct {
    int words[MAX_RESULT_WORD_NUM];
	int hmms[MAX_RESULT_WORD_NUM];
    int ref_count;
    int wordNum;
    int nextFree;
}HypText;

typedef struct{
    HypText *hypTextList;
    int freeHead;
    int usedNum;
}HypTextManager;

void initHypText();
int getNewHypText();
int cloneHypText(int src_word_id,int create);
int returnHypText(int hypTextId);

int getNewToken(Token* parent);
void returnToken(Token* token,Token* preToken);

int HmmCopyMoveToken(Feature *oneFeature, Token *token, int toHmmStateID);
int HmmSpinToken(Feature *oneFeature, Token *token);
int HmmMoveToken(Feature *oneFeature, Token *token, int toHmmStateID);
int passTokenInAM(Feature * oneFeature, Token *token,int isPreSp);
int passTokenInLM(Feature *oneFeature, Token *token);

void initHmmMaxScores();
void initScoreBounds();
void updateTokenHmmMaxScore(Token* token);
void updateAmBoundScores(Token *token);
Token* getPreToken(int tokenID);
float calCutOffThreshold(float lowB,float upB,int num);
void returnTokensByThreshhold(int begin,int end,float threshold);
void cutoffTokenByHmmScore();
void cutOffTokenByTotalScore(int maxTokenNum);
void returnTokensForce(int count);
int cutOffToken();


void printHypText();
void printSortHypText(int framNum);

void printTokenList();
void checkTokenBound();

#endif
