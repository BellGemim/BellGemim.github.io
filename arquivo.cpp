#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

int conta() {
    ifstream arq("vetor.txt");
    int numLinhas = 0;
    string linha;
    
    if (arq.is_open()) {
        while (getline(arq, linha)) {
            numLinhas++;
        }
        arq.close();
    }
    return numLinhas;
}

void troca(int *a, int *b){
    int k = *a;
    *a=*b;
    *b = k;
}

void insertion(int v[], int n){
    for(int i=0; i < n-1; i++){
        int j = i;
        while (j >= 0 && v[j+1] < v[j]){
            troca(&v[j+1], &v[j]);
            j--;
        }
    }
}

int ler(int *v, int n){
    ifstream arq ("vetor.txt");
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo vetor.txt" << endl;
        return -1;
    }
    arq.seekg(0);
    for(int i=0; i < n && !arq.eof(); i++){
        arq >> *(v+i);
    }
    arq.close();
    return 0;
}

int recoloca(int v[], int n){
    ofstream arq ("vetor.txt", ios::trunc);
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo vetor.txt" << endl;
        return -1;
    }
    for(int i=0; i<n; i++){
        arq << v[i] << endl;
    }
    return 0;
}

int main(){
    int n = conta();
    int v[n];
    ler(v, n);
    insertion(v,n);
    for(int l=0;l<n;l++){
        cout << v[l] << endl;
    }
    recoloca(v,n);
    return 0;
}
