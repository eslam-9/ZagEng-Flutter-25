void main(){
    int year=2020;
    if(year%400==0){
        print("A leap year");
    }
    else if(year%100==0){
        print("Not a leap year");
    }
    else if(year%4==0){
        print("A leap year");
    }
    else{
        print("Not a leap year");
    }
}