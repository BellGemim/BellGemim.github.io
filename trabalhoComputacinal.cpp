//eu n fiz a com mil perdão :/

#include <iostream>
#include <math.h>
#include <fstream>
using namespace std;
 
double f(double x){
    return pow(x,3)-10
}

double flinha(double x){
    return 3*pow(x,2)
}


void bisseccao(double *x0, double *x1,double fi ,bool *a){
    double x2 = ((*x1+*x0)/2);
    if (f(x2)>0){
        *x1 = x2;
    }
    else{
        *x0 = x2;
    }
    if(fabs(*x1-*x0)<fi){
        *a = false;
    }
}

void newton(double *x0,double fi ,bool *a){
    double x1= *x0-(f(*x0)/flinha(*x0));
    if ((fabs(x1-*x0)<fi)||(f(x1)<fi)){
        *a = false;
    }
    *x0 = x1;
}

void secante(double *x0, double *x1,double fi ,bool *a){
    double x2 = *x1-((f(*x1)*(*x1-*x0))/(f(*x1)-f(*x0)))
    *x0 = *x1;
    *x1 = x2;
    if((fabs(f(x2))<fi)||(fabs(x2-*x0)<fi)){
        *a = false;
    }
}

void regulafalsi(double *x0, double *x1,double fi ,bool *a){
    double x2= ((*x0*f(*x1)-*x1*f(*x0))/(f(*x1)-f(*x0)));

    if (f(x2)>0){
        *x1 = x2;
    }
    else{
        *x0 = x2;
    }
    if(fabs(*x1-*x0)<fi){
        *a = false;
    }


}


int main() {
    bool bi=true, newt=true, sec=true, falsi=true;
    int abc, i=1;
    double bix0,bix1,newx0,secx0,secx1,falsix0,falsix1,fi;
    ofstream texto("aaaa.txt");
    cout<<"escolha o metodo :"<<endl<<"1-bisssecção"<<endl<<"2-newton"<<endl<<"3-secante"
    <<endl<<"4-regula falsi"<<endl<<"5-todos"<<endl;
    cin>> abc;
    switch (abc){
        case 1:
            newt=false;
            sec=false;
            falsi=false;
        break;
        case 2:
            bi=false;
            sec=false;
            falsi=false;
        break;
        case 3:
            bi=false;
            sec=false;
            falsi=false;
        break;
        case 4:
            bi=false;
            newt=false;
            falsi=false;
        break;
    }
    if(bi==true){
        cout<<"x0 da bissecção:"<<endl;
        cin>>bix0;
        cout<<"x1 da bissecção:"<<endl;
        cin>>bix1;
    }
    if(newt==true){
        cout<<"x0 do newton:"<<endl;
        cin>>newx0;
    }
    if(sec==true){
        cout<<"x0 da secante:"<<endl;
        cin>>secx0;
        cout<<"x1 da secante:"<<endl;
        cin>>secx1;
    }
    if(falsi==true){
        cout<<"x0 da regula falsi:"<<endl;
        cin>>falsix0;
        cout<<"x1 da regula falsi:"<<endl;
        cin>>falsix1;
    }
    cout<<"precisão:"<<endl;
    cin>>fi;
    do{
        texto<<"iteração : "<<i;
        if(bi==true){
            bisseccao(&bix0, &bix1,fi,&bi);
            texto<<" / bissecção : x"<< i-1<<" = "<<bix0<< " x"<< i<<" = "<<bix1;
        }

        if(newt==true){
            newton(&newx0,fi,&newt);
            texto<<" / newton : x"<< i<<" = "<<newx0;
        }

        if(sec==true){
            secante(&secx0, &secx1,fi,&sec);
            texto<<" / secante : x"<< i-1<<" = "<<secx0<<" x"<< i<<" = "<<secx1;
        }

        if(falsi==true){
            regulafalsi(&falsix0, &falsix1,fi,&falsi);
            texto<<" / regula falsi : x"<< i-1<<" = "<<falsix0<<" x"<< i<<" = "<<falsix1;
        } 

        texto<<endl;

    }while(((bi || newt || sec || falsi)==true)||(i<50));

    return 1;
}   