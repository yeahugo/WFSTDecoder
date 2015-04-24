#ifndef PC_DATA_FORMAT_H
#define PC_DATA_FORMAT_H
#include "Model.h"
#include <stdio.h>
#include <stdlib.h>

//与平台相关接口
HMM * getHmm(NETWORK * network, int hmmInd);

//与平台相关接口
SPHMM * getSPHMM(NETWORK * network);

SILHMM * getSILHMM(NETWORK * network);
//平台相关接口
int getTranslations(NETWORK * network,State *state, Translation **translations,  int *count);

//平台相关接口
int getState(NETWORK * network, int stateID, State *state);

#endif