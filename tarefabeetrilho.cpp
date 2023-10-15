#include <iostream>
 
using namespace std;
 
 typedef struct na{
     int info;
     na *prox;
     na *ante;
 } no;
 
  no* push(int x, no* L){
     no *p=NULL, *AUX = NULL;
     AUX = L->ante;
     p = new no;
     p->info = x;
     if(L == NULL){
        p->ante= p;
        p->prox= p;
        L = p; 
        return L;
     }
     else {
       p->ante = L->ante;
       p->prox = L;
       AUX->prox=p;
       L->ante = p;
       return L;
     }
 }
 
 no* pop(int *x, no *L){
    no *p = NULL, *AUX= NULL;
    AUX = L->ante;
    *x = AUX->info;
    L->ante = AUX->ante;
    AUX = AUX->ante;
    AUX->prox = L; 

 }

int main() {
 
   
    return 0;
}