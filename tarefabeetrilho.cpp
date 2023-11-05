#include <iostream>
 
using namespace std;
 


 
int main() {
   int x, j, *L, *M, *N, O[4], k, z, b, i;
   string a;
   do{
    cin>>x;
    if(x!= 0){
        do{
            cin>>a;
            if(a!="0"){
                L = new int[x];
                M = new int[x];
                N = new int[x];
                z=0;
                k=0;
                b=0;
                for(i=0;a[i]!="/0";i++){
                    if((a[i-1]==" ")||(i==0)){
                        z=i;
                    }
                    O[k]=a[i];
                    k++;
                    if((a[i+1]==" ")||(a[i+1]=="/0")){
                        int d=0;
                        for(int c=k;c>0;c--){
                            N[b]+= O[d]*10^c;
                        }
                        b++;
                    }
                    
                }
                j=0;
                for(i=0;i<x;i++){
                    L[i]=i+1;
                }
                for(i=x;i>0;i--){
                    M[j]=i;
                    j++;
                }
                for(i=0;(i<x)||(j<0);i++){
                    if((L[i]!=N[i])&&(L[j]!=N[i])){
                        i=x+1;
                        cout<<"No"<<endl;
                    }
                    j--;
                }
                if(i!=x+1){
                    cout<<"Yes"<<endl;
                }
                
            }
        }while(a!="0");
    }
   }while(x!=0);
    return 0;
}