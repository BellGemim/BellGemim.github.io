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

int truco(int truc, int i, int *gr1, int *gr2){
    int p;
    do{
    system("cls");
    printf("1 - aceitar truco de %i\n", truc);
    printf("2 - recusar\n");
    printf("3 - aumentar aposta\n");
    cin>>p;
    switch (p){
        case 1:
            return truc;
        break;
        case 2:
            if (i == 0 || i==2){
                *gr1 +=truc;
                return 0;
            }
            else{
                *gr2 +=truc;
                return 0;
            }
        break;
        case 3:
            return truco(truc+3,i,&*gr1,&*gr2);;                
        break;
        }
    }while(p!= 1||2||3);
}



int main(){
    no *deck = NULL, *jog[4] = {NULL,NULL,NULL,NULL}, *descarte = NULL, *coorti = NULL, *save[4];
    int gr1 = 0, gr2= 0, corte, joga, p;
    srand(time(NULL));
    while (gr1 < 12 && gr2 < 12){
        int truc = 1;
        inicio(&deck,jog);
        corte = rand()%conta(deck);
        deck = discarta(deck, &coorti, corte);
        for(int i=0;i<4;i++){
            system("cls");
            imprimePilha(coorti,1);
            if(descarte != NULL){
                imprimePilha(descarte,conta(descarte));
            }
            imprimePilha(jog[i],conta(jog[i]));
            if(truc == 1){
                printf("\n");
                printf("Truca?\n");
                printf("1 - Sim\n");
                printf("2 - Nao\n");
                cin>>p;
                if(p == 1){
                    truc = truco(3,i,&gr1,&gr2);
                }
            }
            if (truc == 0 ){
                i = 4;
            }
            else{
                imprimePilha(coorti,1);
                if(descarte != NULL){
                    imprimePilha(descarte,conta(descarte));
                }
                imprimePilha(jog[i],conta(jog[i]));
                cin>>joga;
                jog[i]=discarta(jog[i],&save[i],joga);
            }
        }

        
    }
    if (gr1>12){
        cout << "grupo 1 venceu"<<endl;
    }
    else{
        cout << "grupo 2 venceu"<<endl;
    }

}