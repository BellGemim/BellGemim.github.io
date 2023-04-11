#include <iostream>
#include <iomanip>
#include <fstream>
using namespace std;

typedef struct {
    string titulo;
    int codigo;
} Livro;

int insere_livros(){
    Livro livro;
    ofstream arq ("livros.txt", ios::app);
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo livros.txt" << endl;
        return -1;
    }
    do{
        cout << "Codigo (0 (zero) para finalizar): ";
        cin >> livro.codigo;
        if (livro.codigo != 0){
            cout << "Titulo: ";
            cin.get();
            getline(cin, livro.titulo);
            arq << livro.titulo << endl;
            arq << livro.codigo;// << endl;
        }
    } while(livro.codigo != 0);
    arq.close();
    return 0;
}

int mostra_todos(){
    Livro livro;
    ifstream arq ("livros.txt");
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo livros.txt" << endl;
        return -1;
    }
    cout << "Codigo Titulo " << endl;
    while (arq.good()){ //verifica eof ou alguma outra incorretude no arquivo
        getline(arq, livro.titulo);
        arq >> livro.codigo;
        cout << setw(6) << livro.codigo << " ";
        cout << livro.titulo << endl;
    }
    arq.close();
    return 0;
}

int insere_livros(){
    Livro livro;
    ofstream arq ("livros.txt", ios::app);
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo livros.txt" << endl;
        return -1;
    }
    do{
        cout << "Codigo (0 (zero) para finalizar): ";
        cin >> livro.codigo;
        if (livro.codigo != 0){
            cout << "Titulo: ";
            cin.get();
            getline(cin, livro.titulo);
            arq << livro.titulo << endl;
            arq << livro.codigo;// << endl;
        }
    } while(livro.codigo != 0);
    arq.close();
    return 0;
}

Livro* busca_livro(int cod, ifstream& arq){ //& especifica a passagem por referência
    Livro *livro;
    livro = new (nothrow) Livro;
    arq.seekg(0);
    do{
        getline(arq, livro->titulo);
        arq >> livro->codigo;
    } while (livro->codigo != cod && !arq.eof());
    if (livro->codigo == cod){
        return livro;
    }
    else{
        return NULL;
    }
}

int busca(){
    int cod;
    Livro *livro;
    ifstream arq ("livros.txt");
    if (!arq){
        cout << "Nao foi possivel abrir o arquivo livros.txt" << endl;
        return -1;
    }
    do{
        cout << "Qual livro deseja procurar (0 (zero) para finalizar)? ";
        cin >> cod;
        if (cod != 0){
            livro = busca_livro(cod, arq);
            if (livro){
                cout << "Titulo: " << livro->titulo << endl;
            }
            else{
                cout << "Livro nao cadastrado" << endl;
            }
        }
    } while(cod != 0);
    arq.close();
    delete livro;
    livro = NULL;
    return 0;
}

int main(){
    char opcao;
    do{
        cout << "(I)nsere (L)ista (B)usca (F)inaliza" << endl;
        cin >> opcao;
        opcao = toupper(opcao);
        cin.get();
        switch (opcao){
            case 'I':
            insere_livros() == -1? cout << "Nao foi possivel abrir o arquivo para
            insercao de dados" : cout << endl;
            break;
            case 'L':
            mostra_todos() == -1? cout << "Nao foi possivel abrir o arquivo para
            leitura dos dados" : cout << endl;
            break;
            case 'B':
            busca();
            break;
        }
    } while (opcao != 'F');
    return 0;
}