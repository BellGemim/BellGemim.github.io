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
    no *deck = NULL, *jog[4] = {NULL,NULL,NULL,NULL}, *descarte = NULL;
    int gr1 = 0, gr2= 0;
    carta save[4];
    while (gr1 < 12 && gr2 < 12){
        inicio(&deck,jog);
        
    }


}