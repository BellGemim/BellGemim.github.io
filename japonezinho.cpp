#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

int f(int y){
    if(y==1){
        return 1;
    }
    else{
        return f(y-1)+y;
    }
}

int main(){
    int y;
    cin>>y;
    cout<< f(y)<< endl;
}