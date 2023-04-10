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
    int ponto;
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
    no *N=NULL, *P=NULL;

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
	carta entrada[40]; 
    int i;
    for( i = 0; i<10; i++){
        entrada[i].naipe='P';
    }
    for( i = 10; i<20; i++){
        entrada[i].naipe='O';
    }
    for(i = 20; i<30; i++){
        entrada[i].naipe='E';
    }
    for( i = 30; i<40; i++){
        entrada[i].naipe='C';
    }

     entrada[0].valor=1;
    entrada[0].ponto=8;
    entrada[1].valor=2;
    entrada[1].ponto=9;
    entrada[2].valor=3;
    entrada[2].ponto=10;
    entrada[3].valor=4;
    entrada[3].ponto=1;
    entrada[4].valor=5;
    entrada[4].ponto=2;
    entrada[5].valor=6;
    entrada[5].ponto=3;
    entrada[6].valor=7;
    entrada[6].ponto=4;
    entrada[7].valor=11;
    entrada[7].ponto=6;
    entrada[8].valor=12;
    entrada[8].ponto=5;
    entrada[9].valor=13;
    entrada[9].ponto=7;

    entrada[10].valor=1;
    entrada[10].ponto=8;
    entrada[11].valor=2;
    entrada[11].ponto=9;
    entrada[12].valor=3;
    entrada[12].ponto=10;
    entrada[13].valor=4;
    entrada[13].ponto=1;
    entrada[14].valor=5;
    entrada[14].ponto=2;
    entrada[15].valor=6;
    entrada[15].ponto=3;
    entrada[16].valor=7;
    entrada[16].ponto=4;
    entrada[17].valor=11;
    entrada[17].ponto=6;
    entrada[18].valor=12;
    entrada[18].ponto=5;
    entrada[19].valor=13;
    entrada[19].ponto=7;

    entrada[20].valor=1;
    entrada[20].ponto=8;
    entrada[21].valor=2;
    entrada[21].ponto=9;
    entrada[22].valor=3;
    entrada[22].ponto=10;
    entrada[23].valor=4;
    entrada[23].ponto=1;
    entrada[24].valor=5;
    entrada[24].ponto=2;
    entrada[25].valor=6;
    entrada[25].ponto=3;
    entrada[26].valor=7;
    entrada[26].ponto=4;
    entrada[27].valor=11;
    entrada[27].ponto=6;
    entrada[28].valor=12;
    entrada[28].ponto=5;
    entrada[29].valor=13;
    entrada[29].ponto=7;

    entrada[30].valor=1;
    entrada[30].ponto=8;
    entrada[31].valor=2;
    entrada[31].ponto=9;
    entrada[32].valor=3;
    entrada[32].ponto=10;
    entrada[33].valor=4;
    entrada[33].ponto=1;
    entrada[34].valor=5;
    entrada[34].ponto=2;
    entrada[35].valor=6;
    entrada[35].ponto=3;
    entrada[36].valor=7;
    entrada[36].ponto=4;
    entrada[37].valor=11;
    entrada[37].ponto=6;
    entrada[38].valor=12;
    entrada[38].ponto=5;
    entrada[39].valor=13;
    entrada[39].ponto=7;


	for( i = 0;i<40;i++){
		*L = insereFP(&*L,entrada[i],i);
	}
}

no *deletapilha(no *L){
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
        *L = POP(*L,&deck[i]);
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

no *discarta(no *mao, no **descarte, int escolha){
    no *gi ;
    gi = mao;
    carta save;
    for (int i=0;i<escolha;i++){
        gi = gi->prev;
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




int truco(int truc, int i, int *gr1, int *gr2, no *jog[4]){
    int p;
    do{
    system("cls");
    imprimePilha(jog[i+1],conta(jog[i+1]));
    printf("1 - aceitar truco de %i\n", truc);
    printf("2 - recusar\n");
    printf("3 - aumentar aposta\n");
    cin>>p;
    switch (p){
        case 1:
            return truc;
        break;
        case 2:
            if (i%2==0){
                *gr1 +=truc;
                return 0;
            }
            else{
                *gr2 +=truc;
                return 0;
            }
        break;
        case 3:
            return truco(truc+3,i+1,&*gr1,&*gr2, jog);;                
        break;
        }
    }while(p!= 1||2||3);
}

void imprimetudo(no *coorti,no *save[4], no *jog[4], int i){
    imprimePilha(coorti,1);
    if(save[0] != NULL){
        imprimePilha(save[0],conta(save[0]));
    }
    if(save[1] != NULL){
        imprimePilha(save[1],conta(save[1]));
    }
    if(save[2] != NULL){
        imprimePilha(save[2],conta(save[2]));
    }
    if(save[3] != NULL){
        imprimePilha(save[3],conta(save[3]));
    }
    imprimePilha(jog[i],conta(jog[i]));
}

void manilha(no **deck,no *coorti, int conta){
    no *F;
    F = *deck;
    for(int i = 0; i<conta;i++){
        if(coorti->info.ponto != 10){
            if(F->info.ponto==coorti->info.ponto+1){
                switch(F->info.naipe){
                    case 'O':
                        F->info.ponto +=10; 
                    break;
                    case 'E':
                        F->info.ponto +=20; 
                    break;
                    case 'C':
                        F->info.ponto +=30; 
                    break;
                    case 'P':
                        F->info.ponto +=40; 
                    break;
                } 
            } 
        }
        else{
            if(F->info.ponto== 1){
                switch(F->info.naipe){
                    case 'O':
                        F->info.ponto +=10; 
                    break;
                    case 'E':
                        F->info.ponto +=20; 
                    break;
                    case 'C':
                        F->info.ponto +=30; 
                    break;
                    case 'P':
                        F->info.ponto +=40; 
                    break;
                } 
            } 
        }
        F=F->prox;
    }
}

void desmanilha(no **deck, int conta){
    no *F;
    F = *deck;
    for(int i = 0; i<conta;i++){
        if(F->info.ponto>10 && F->info.ponto<20){
            F->info.ponto -=10;  
        }
        if(F->info.ponto>20 && F->info.ponto<30){
            F->info.ponto -=20;  
        }
        if(F->info.ponto>30 && F->info.ponto<40){
            F->info.ponto -=30;  
        }
        if(F->info.ponto>40 && F->info.ponto<50){
            F->info.ponto -=40;  
        }
        F=F->prox;
    }
}

void reagrupa( no **coorti, no **deck, no *save[4], no *jog[4]){
 if(*coorti!=NULL){
            *deck = adiciona(*deck,&*coorti);
        }
        for(int i=0;i<4;i++){
            if(save[i]!= NULL){
                *deck = adiciona(*deck,&save[i]);
            }
        }
        for(int i=0;i<3;i++){
            for(int i=0;i<4;i++){
                if(jog[i]!= NULL){
                    *deck = adiciona(*deck,&jog[i]);
                }
            }
        }
        desmanilha(&*deck,conta(*deck));
}

int main(){
    no *deck = NULL, *jog[4], *coorti = NULL, *save[4];
    int gr1 = 0, gr2= 0, corte, p, joga, truc, ponto1, ponto2;
    srand(time(NULL));
    for(int i=0;i<4;i++){
        jog[i]=NULL;
    }
    for(int i=0;i<4;i++){
        save[i]=NULL;
    }
    criaDeck(&deck);
    while (gr1 < 13 && gr2 < 13){
        truc = 1;
        ponto1 = ponto2 = 0;
        reagrupa(&coorti, &deck, save, jog);
        corte = rand()%conta(deck);
        deck = discarta(deck, &coorti, corte);
        manilha(&deck,coorti,conta(deck));
        embaralha(&deck,conta(deck));
        
        for(int i = 0;i<4;i++){
            for(int j =0; j<3;j++){
                jog[i] = compra(jog[i],&deck);
            }
        }
        while(ponto1 < 2 && ponto2 < 2){
            for(int i=0;i<4;i++){
                system("cls");
                imprimetudo(coorti,save,jog,i);
                if(truc == 1){
                    printf("\n");
                    printf("Truca?\n");
                    printf("1 - Sim\n");
                    printf("2 - Nao\n");
                    cin>>p;
                    if(p == 1){
                        truc = truco(3,i,&gr1,&gr2,jog);
                    }
                }
                if (truc == 0 ){
                    i = 4;
                    ponto1 = ponto2 = 3;
                }
                else{
                    imprimetudo(coorti,save,jog,i);
                    cin>>joga;
                    jog[i]=discarta(jog[i],&save[i],joga);
                }
            }
            int l = 5, maior = 0;
            for(int i=0;i<4;i++){
                if(save[i] != NULL){
                    if(maior < save[i]->info.ponto){
                        l = i;
                        maior = save[i]->info.ponto;
                    }
                    else if(maior == save[i]->info.ponto){
                        l=5;
                    }
                }
            }
            if (l== 5){
                ponto1++;
                ponto2++;
            }else if(l == 0 || 2){
                ponto1++;
            }else if(l == 1 || 3){
                ponto2++;
            }
            for(int i=0;i<4;i++){
                if(save[i]!= NULL){
                    deck = adiciona(deck,&save[i]);
                }
            }
        }

        if (ponto1>ponto2){
            gr1+=truc;
            printf("time 1 ganha %i pontos e esta com %i pontos \n", truc, gr1);
        }else if(ponto1<ponto2){
            gr2+=truc;
            printf("time 2 ganha %i pontos e esta com %i pontos \n", truc, gr2);
        }
    }
    if (gr1>12){
        cout << "grupo 1 venceu"<<endl;
    }
    else{
        cout << "grupo 2 venceu"<<endl;
    }

}