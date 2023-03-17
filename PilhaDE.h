#include <iostream>
#include <stdio.h>     
#include <stdlib.h>     
#include <time.h> 
#include <stdlib.h>
#include <string.h>
using namespace std;

typedef struct{
	char naipe;
	int valor;
} carta;

typedef struct NoTag {
	carta info;
	int prior;
	struct NoTag *prox;
	struct NoTag *prev;
} no;


no *inicializaPilha() {
	return NULL;
}

void imprimePilha(no *L, int n) {
	no *P;
	P = L;
	P = P->prev;
		
	for(int i = 0; i<n;i++){
        printf("%i- ",i);
		switch (P->info.valor){
			case 1:
				printf("As de ");
			break;
			case 11:
				printf("valete de ");
			break;
			case 12:
				printf("rainha de ");
			break;
			case 13:
				printf("rei de ");
			break;
			default:
			    printf("%i de ",P->info.valor);
			break;
		}
		switch (P->info.naipe){
			case 'P':
				printf("paus");
			break;
			case 'O':
				printf("ouros");
			break;
			case 'E':
				printf("espadas");
			break;
			case 'C':
				printf("copas");
			break;
		}
		printf("    ");
		P = P->prev;
	}
	printf("\n");
}


no *PUSH(no *L, carta x){
    no *ne;
    ne = (no *) malloc(sizeof(no));
    ne->info = x;
    if (L == NULL) {
        ne->prox = ne;
        ne->prev = ne;
        return ne;
    } else {
        no *la = L->prev;
        ne->prox = L;
        ne->prev = la;
        la->prox = ne;
        L->prev = ne;
        return L;
    }
}


no* insereFP(no **L, carta valor, int prior) {
    no *N, *P;

    N = (no *) malloc(sizeof(no));
    N->info = valor;
    N->prior = prior;
    N->prev = N->prox = N;

    if (*L == NULL) {
        *L = N;
        return N;
    }
    else {
        P = *L;

        while (P->prior < prior && P->prox != *L) {
            P = P->prox;
        }

        N->prev = P->prev;
        N->prox = P;

        P->prev->prox = N;
        P->prev = N;

        if (P == *L && prior < P->prior) {
            *L = N;
        }

        return N;
    }
}


no *POP(no *L, carta *n) {
	if (L == NULL) {
        return NULL;
    } else if (L->prox == L) {
        *n = L->info;
        delete L;
        L = NULL;
        return L;
    } else {
        no *la = L->prev;
        *n = la->info;
        la->prev->prox = L;
        L->prev = la->prev;
        delete la;
        return L;
    }
}

void criaDeck(no **L){
	carta entrada[52]; 
    srand (time(NULL));
    for(int i = 1; i<14; i++){
        entrada[i-1].naipe='P';
    }
    for(int i = 14; i<27; i++){
        entrada[i-1].naipe='O';
    }
    for(int i = 27; i<40; i++){
        entrada[i-1].naipe='E';
    }
    for(int i = 40; i<53; i++){
        entrada[i-1].naipe='C';
    }


    for(int i = 1; i<14; i++){
        entrada[i-1].valor=i;
    }
    for(int i = 14; i<27; i++){
        entrada[i-1].valor=i-13;
    }
    for(int i = 27; i<40; i++){
        entrada[i-1].valor=i-26;
    }
    for(int i = 40; i<53; i++){
        entrada[i-1].valor=i-39;
    }

	for(int i = 0;i<52;i++){
		insereFP(&*L,entrada[i],i);
	}
}

no *deletapilhas(no *L){
    if (L==NULL){
        return NULL;
    }
    no *atual = L;
    while (atual->prox != L) {
        atual = atual->prox;
        delete (atual->prev);
    }
    delete atual;
    return NULL;
}

void embaralha(no **L, int n){
    carta deck[n];
    int c;
    no *P;
    P = *L;
    srand (time(NULL));

    for (int i=0; i<n; i++){
        deck[i]=P->info;
        P=P->prox;
    }

    for(int i = 0;i<n;i++){
        c = rand()%100;
		insereFP(&*L,deck[i],c);
	}
}

int conta(no *L){
    if(L!=NULL){
        int i;
        no *P;
        P=L;
        for(i = 1; P->prox!=L;i++){
            P=P->prox;
        }
        return i;
    }
    else{
        return 0;
    }
}

no *compra(no *mao, no **deck){
    carta save;
    *deck=POP(*deck,&save);
    return PUSH(mao,save);
}

no *discarta(no *mao, no **descarte){
    no *gi = mao;
    carta save;
    int escolha;
    cin>>escolha;
    for (int i=0;i<escolha;i++){
        gi = gi->prox;
    }
    gi = POP(gi,&save);
    *descarte = PUSH(*descarte,save);
    return mao;
}

no *adiciona(no *mao, no **descarte){
    carta save;
    *descarte = POP(*descarte, &save);
    return PUSH(mao,save);
}