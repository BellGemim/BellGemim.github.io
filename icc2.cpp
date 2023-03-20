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
        imprimePilha(deck,conta(deck));
        break;
        case 2:
        mao = compra(mao,&deck);
        imprimePilha(mao, conta(mao));
        break;
        case 3:
        if (mao != NULL){
            mao = discarta(mao,&descarte);
            imprimePilha(descarte,conta(descarte));
        }
        break;
        case 4:
        if (descarte != NULL){
            mao = adiciona(mao, &descarte);
            imprimePilha(mao, conta(mao));
        }
        break;

    }
    }while (c != 5);
}