#include "WFSTDecoder.h"
#include "defines.h"
#include <stdio.h>
#include <stdlib.h>

#include <assert.h>

const char * _fileName = "./data/feature_files/wcjd_n.mfcc";
const char *_hmmfile = "./data/final.am";
const char *_transfile = "./data/final.lm";
const char *_wordIdMapfiel = "./data/final.map";

int main(int argc, const char * argv[])
{
    FILE * pFile;
    long lSize;
    size_t result;
	if (argc == 2) {
		_fileName = argv[1];
	}
    pFile = fopen(_fileName, "rb");
    if (pFile == NULL) {
        printf("fail to open mfcc file.\n");
        return -1;
    }
    fseek(pFile, 0, SEEK_END);
    lSize = ftell(pFile);
	fseek ( pFile , 12 , SEEK_SET );
    Feature *feature = (Feature *) malloc(lSize);
    
    result = fread(feature, 1, lSize, pFile);
    if (result != lSize - 12) {
        printf("reading error");
        return -1;
    }
    
    fclose(pFile);

    int featureNum = (int)(lSize/sizeof(Feature));
    if ( initWFSTDecoder(_hmmfile, _transfile, _wordIdMapfiel) != 0) {
        printf("init wfst decoder fail.\n");
        return -1;
    }
    if (processFeatures(feature, featureNum) != 0) {
        printf("process feature fail.\n");
        return -1;
    }
    
    free(feature);
    
    char buf[MAX_RESULT_WORD_NUM * 10];
    getResult(buf);
    printf("words result is %s",buf);
    
    return 0;
}
