#include <iostream>
#include <stdio.h>     
#include <stdlib.h>     
#include <time.h> 
#include <stdlib.h>
#include <string.h>
#include "PilhaDE.h"
using namespace std;


int main(){
    no *deck = NULL, *mao = NULL, *descarte = NULL;
    carta save;
    criaDeck(&deck);
    int c;
    do{
    printf("\n");
    printf("1 - Shuffle Deck\n");
    printf("2 - Draw\n");
    printf("3 - Discart\n");
    printf("4 - from discart pile to hand\n");
    printf("5 - Sair\n");
    printf("\n Escolha: ");
    cin>>c;
    
    switch(c){
        case 1:
        embaralha(&deck,conta(deck));
        printf("\n Deck shuffled");
        break;
        case 2:
        deck=POP(deck,&save);
        mao = PUSH(mao,save);
        imprimePilha(mao, conta(mao));
        break;
        case 3:
        if (mao != NULL){
            mao = POP(mao,&save);
            descarte = PUSH(descarte,save);
            imprimePilha(descarte,conta(descarte));
        }
        break;
        case 4:
        if (descarte != NULL){
            descarte = POP(descarte, &save);
            mao = PUSH(mao,save);
            imprimePilha(mao, conta(mao));
        }
        break;

    }
    }while (c != 5);
}