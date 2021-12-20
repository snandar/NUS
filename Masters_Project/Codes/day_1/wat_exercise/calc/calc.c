int calc(int choice, int a, int b) { 
  if(choice == 1){
    return add(a,b);
  }
  else if(choice == 2){
    return sub(a,b);
  }
  else{
    return -1;
  }

}

int add(int a, int b){
  return a + b;
}

int sub(int a, int b){
  return a - b;
}