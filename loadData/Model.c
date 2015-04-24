#include "Model.h"
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "PcDataFormat.h"
#include "../defines.h"

#include "assert.h"

real LogAdd(const real x,const real y){
  const real MINLOGEXP= -log(-LOG_ZERO);
  real tmp=x,diff=y-x;
  if (x<y) { tmp = y; diff= -diff;}
  if (diff<MINLOGEXP) return (tmp<LSMALL)?LOG_ZERO:tmp;
  return tmp+log(1.0+exp(diff));
}

int getTextsByWordIds(NETWORK * network, int *wordID, int size, char *words, int *resultLen){
  int i = 0;
  int id = 0;
  int curPos = 0;
  int endPos = 0;
  int wordLen = 0;
  char *tmpWords = words;

  if(wordID == NULL || words == NULL || size <= 0){
    return -1;
  }


  for(i = 0; i < size; i ++){
    id = wordID[i];
    curPos = network->wordIds[id];
    endPos =  network->wordIds[id + 1] - 1;
    memcpy(tmpWords, network->words + curPos, endPos - curPos +1);
    tmpWords += endPos - curPos +1;
    *(tmpWords++) = ' ';
    wordLen = wordLen + (endPos - curPos + 2);
  }

  *resultLen = wordLen;
  return 0;
}

real getFrameScore(NETWORK *network, real *frame, int hmmInd, int currState, int nextState) {
  assert(frame != NULL);
  real amscore=0;
  if (IS_SILHMM(hmmInd)){
    amscore = getSilHmmTransScore(network,hmmInd,currState,nextState);
	float tranScore = amscore;
    if (0 < nextState && nextState <= EMIT_STATE_NUM) {
      amscore += calSilHmmEmitScore(network,frame,hmmInd,nextState);
    }
	//printf("##sil score:%f,tranScore:%f,hmmind:%d,currState:%d,nextState:%d\n",amscore,tranScore,hmmInd,currState,nextState);
  } else if (IS_SPHMM(hmmInd)) {
    amscore = getSpHmmTransScore(network,hmmInd,currState,nextState);
    if (nextState == 1) {
      amscore += calSpHmmEmitScore(network,frame,hmmInd,nextState);
    }
  } else {
    amscore = getHmmTransScore(network,hmmInd,currState,nextState);
    if (0 < nextState && nextState <= EMIT_STATE_NUM) {
      amscore += calHmmEmitScore(network,frame,hmmInd,nextState);
    }
  }
  return amscore;
}


real calHmmEmitScore(NETWORK * network,real *frame,int hmmInd, int currState) {
  int i,j;
  real mixCurScore[GMM_COMP_NUM];
    real mixScore = LOG_ZERO;
  real sumxmu = 0.0;
  real xmu = 0.0;
  MGMM *gmm = &getHmm(network,hmmInd)->mixtureGmm[currState -1];
  for ( i=0 ; i < GMM_COMP_NUM; i++ ){
        sumxmu = gmm->mGmm[i].sumLogVarPlusNObsLog2Pi;
        for ( j=0 ; j<FRAM_VAR_SIZE ; j++ ){
            if(frame[j] < LOG_ZERO ){
        xmu = (LOG_ZERO - gmm->mGmm[i].means[j]);
            } else {
        xmu = (frame[j] - gmm->mGmm[i].means[j]);
            }
            sumxmu += xmu * xmu * gmm->mGmm[i].minusHalfOverVars[j];
        }
        mixCurScore[i] = sumxmu;
    }

    for( i=0 ; i<GMM_COMP_NUM; i++ ){
        mixScore = LogAdd(mixScore, mixCurScore[i] + gmm->mGmm[i].logCompWeights);
    }
  //printf("mixScore = %f\n" , mixScore);
  return mixScore;
}

real calSpHmmEmitScore(NETWORK * network,real *frame,int hmmInd, int currState) {
  int i,j;
  real mixCurScore[GMM_COMP_NUM];
  real mixScore = LOG_ZERO;
  real sumxmu = 0.0;
  real xmu = 0.0;
  assert(currState == 1);
  MGMM *gmm = &getSPHMM(network)->mixtureGmm[currState - 1];
  for ( i=0 ; i < GMM_COMP_NUM; i++ ){
        sumxmu = gmm->mGmm[i].sumLogVarPlusNObsLog2Pi;
        for ( j=0 ; j<FRAM_VAR_SIZE ; j++ ){
            if(frame[j] < LOG_ZERO ){
        xmu = (LOG_ZERO - gmm->mGmm[i].means[j]);
            } else {
        xmu = (frame[j] - gmm->mGmm[i].means[j]);
            }
            sumxmu += xmu * xmu * gmm->mGmm[i].minusHalfOverVars[j];
        }
        mixCurScore[i] = sumxmu;
    }

    for( i=0 ; i<GMM_COMP_NUM; i++ ){
        mixScore = LogAdd(mixScore, mixCurScore[i] + gmm->mGmm[i].logCompWeights);
    }
  //printf("mixScore = %f\n" , mixScore);
  return mixScore;
}

real calSilHmmEmitScore(NETWORK * network,real *frame,int hmmInd, int currState) {
  int i,j;
  real mixCurScore[GMM_COMP_NUM];
    real mixScore = LOG_ZERO;
  real sumxmu = 0.0;
  real xmu = 0.0;
  MGMM *gmm = &getSILHMM(network)->mixtureGmm[currState -1];
  for ( i=0 ; i < GMM_COMP_NUM; i++ ){
        sumxmu = gmm->mGmm[i].sumLogVarPlusNObsLog2Pi;
        for ( j=0 ; j<FRAM_VAR_SIZE ; j++ ){
            if(frame[j] < LOG_ZERO ){
        xmu = (LOG_ZERO - gmm->mGmm[i].means[j]);
            } else {
        xmu = (frame[j] - gmm->mGmm[i].means[j]);
            }
            sumxmu += xmu * xmu * gmm->mGmm[i].minusHalfOverVars[j];
        }
        mixCurScore[i] = sumxmu;
    }

    for( i=0 ; i<GMM_COMP_NUM; i++ ){
        mixScore = LogAdd(mixScore, mixCurScore[i] + gmm->mGmm[i].logCompWeights);
    }
  //printf("mixScore = %f\n" , mixScore);
  return mixScore;
}


real getHmmTransScore(NETWORK * network,int hmmInd, int currState, int nextState) {
  assert(!IS_SPHMM(hmmInd) && !IS_SILHMM(hmmInd));
  assert(currState >= 0 && currState <= 3);
  assert(nextState >= 1 && nextState <= 4);
  assert(currState == nextState || nextState == currState + 1);

  HMM *amHmm = getHmm(network,hmmInd);
  return amHmm->transMatrix[currState + nextState];
}

real getSpHmmTransScore(NETWORK * network,int hmmInd, int currState, int nextState) {
  assert(IS_SPHMM(hmmInd));
  assert(currState >= 0 && currState <= 1);
  assert(nextState >= 1 && nextState <= 2);
  SPHMM *spHmm = getSPHMM(network);
  return spHmm->transMatrix[currState][nextState];
}

real getSilHmmTransScore(NETWORK * network,int hmmInd, int currState, int nextState) {
  assert(IS_SILHMM(hmmInd));
  assert(currState >= 0 && currState <= 3);
  assert(nextState >= 1 && nextState <= 4);
  SILHMM *silHmm = getSILHMM(network);
  return silHmm->transMatrix[currState][nextState];
}


int getTranslationIDs(NETWORK * network, int stateID, Translation **translations){
  assert(stateID >= 0 && translations != NULL);
  assert(stateID <= network->n_state - 1);

  State state;
  int count = -1;
  if(getState(network, stateID, &state) < 0){
    return -1;
  }
  if(getTranslations(network, &state, translations, &count) < 0){
    return -1;
  }
  return count;
}

