#include <stdio.h>
#include "Model.h"
#include "PcDataFormat.h"


int main(){

	
	NETWORK network;
    Translation *translations;
	int statnum;
	int count = 0; 

	if(-1 == init(&network, "F:\\zhu\\newhmmdefs", "F:\\zhu\\newfinal.fsm", "F:\\zhu\\final.map")){
		printf("error!");
	}

	getchar();
	//printf("toID = %d, hmmID = %d, weight = %f\n", network.translations[0].toStateID, network.translations[0].hmmID, network.translations[0].weight);


	while(1){
		printf("please input statnum:");
		scanf("%d",&statnum);

		if( -1 == getTranslationIDs(&network, 
			statnum,  &translations,  &count)){
				printf("getTranslation error!");
				continue;
		}

		printf("count = %d, weight= %f, lastweitght= %f\n", count, translations[0].weight, translations[count-1].weight);
	}
	getchar();
	return 0;
}