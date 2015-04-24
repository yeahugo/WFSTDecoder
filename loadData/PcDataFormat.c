#include "PcDataFormat.h"
//与平台相关接口文件
int loadDateToBuf(const char *fileName, char ** buf){
	int size = 0;
	char *tmpBuf = NULL;
	FILE * fd = NULL;
	if (!fileName) {
		printf("failed to open file.\n");
		return -1;
	}

	fd = fopen(fileName,"rb");
	if (!fd) {
		printf("failed to open file.\n");
		return -1;
	}
	fseek (fd, 0, SEEK_END);
	size = ftell(fd);
	rewind (fd);
	tmpBuf = (char*)malloc(size);
	if(fread(tmpBuf,1, size,fd) != size){
		printf("failed to read file. fileName: %s\n", fileName);
		fclose(fd);
		return -1;
	}
	*buf = tmpBuf;
	fclose(fd);
	return 0;
}


int init(NETWORK * network, const char * hmmfile, const char *transfile, const char *wordIDmapfile){
	int* pIndex_len = NULL;
	char* buf = NULL;

	network->amHmms = NULL;
	network->n_amHmm = -1;
	network->n_state = -1;
	network->states = NULL;
	network->n_translation = -1;
	network->translations = NULL;
	network->wordIds = NULL;
	network->n_wordId = -1;
	network->words = NULL;

	if(loadDateToBuf(hmmfile, &buf) < 0){
		free(buf);
		return -1;
	}
    pIndex_len = (int*)buf;
    network->n_amHmm = *pIndex_len;
    network->spHmm = *(SPHMM *)(buf + 4);
    network->silHmm = *(SILHMM *)(buf + 4 + sizeof(SPHMM));
    network->amHmms = (HMM *)(buf + 4 + sizeof(SPHMM) + sizeof(SILHMM));
	buf = NULL;

	if(loadDateToBuf(transfile, &buf) <  0){
		free(buf);
		return -1;
	}
	pIndex_len = (int*)buf;
    network->n_translation = *pIndex_len;
    network->n_state = *(int *)(buf + 4);
	network->states = (State *)(buf + 4 + 4);
    network->translations = (Translation *)(buf + 4 + 4 + sizeof(State) * network->n_state);
	buf = NULL;

	if(loadDateToBuf(wordIDmapfile, &buf) < 0){
		free(buf);
		return -1;
	}
	pIndex_len = (int*)buf;
	network->n_wordId = *pIndex_len;
	network->wordIds = (int*)(buf + 4);
	network->words = (char*)(buf + 4 + *pIndex_len);
	return 0;

}


HMM * getHmm(NETWORK * network, int hmmInd){
	if(hmmInd < 0 || hmmInd > network->n_amHmm){
		return NULL;
	}

	return network->amHmms+hmmInd;
}


//与平台相关接口
SPHMM * getSPHMM(NETWORK * network){
	return &network->spHmm;
}

SILHMM * getSILHMM(NETWORK * network){
	return &network->silHmm;
}

//平台相关接口
int getTranslations(NETWORK *network, State *state, Translation **translations,  int *count){
	*translations = network->translations + state->transIDBegin;
	*count = state->transIDNum;
	return 0;
}

//平台相关接口
int getState(NETWORK * network, int stateID, State *state){
	if(stateID < 0 || stateID > network->n_state - 1){
		return -1;
	}
	*state =  *(network->states + stateID);
	return 0;
}
