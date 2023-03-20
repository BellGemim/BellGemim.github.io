#include <iostream>
#include <stdio.h>     
#include <stdlib.h>     
#include <time.h> 
#include <stdlib.h>
#include <string.h>
#include "PilhaDE.h"
using namespace std;

void inicio(no **deck, no *jog[4]){
    *deck = deletapilha(*deck);
    for (int i = 0; i<4;i++){
        jog[i] = deletapilha(jog[i]);
    }
    criaDeck(&*deck);
    embaralha(&*deck,conta(*deck));
    for(int i = 0;i<4;i++){
        for(int j =0; j<3;j++){
          jog[i] = compra(jog[i],&*deck);
        }
    }
}

int main(){
    no *deck = NULL, *jog[4] = {NULL,NULL,NULL,NULL}, *descarte = NULL, *coorti = NULL, *save[4];
    int gr1 = 0, gr2= 0, corte, joga, ponto, p;
    srand(time(NULL));
    while (gr1 < 12 && gr2 < 12){
        int truco;
        inicio(&deck,jog);
        corte = rand()%conta(deck);
        discarta(deck, &coorti, corte);
        for(int i=0;i<4;i++){
            printf("\n");
            printf("Truca?\n");
            printf("1 - Sim\n");
            printf("2 - Nao\n");
            cin>>p;
            if(p == 1){
            printf("1 - 3\n");
            printf("2 - 6\n");
            printf("3 - 9\n");
            printf("4 - 12\n");
            }
            imprimePilha(coorti,1);
            imprimePilha(jog[i],conta(jog[i]));
            cin>>joga;
            jog[i]=discarta(jog[i],&save[i],joga);
        }

        
    }


}