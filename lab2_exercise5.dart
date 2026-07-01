void printGrade(int score) {
   print('Score: $score');
   if (score >= 80){
    print ('U got A');
  } else if (score >= 70){
    print ('B');
  } else if (score >= 60){
    print ('C');
  } else if (score >= 50){
    print ('D');
  } else {
      print ('F');
  }
  print('....');
}

void main() {

  printGrade(65);
  printGrade(77);
  printGrade(52);
  printGrade(47);

  print('Num 1 to 10:');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
  print('...');


  var fruits = ['cherry', 'kiwi', 'pineapple'];
  print('Fruits:');
  for (var fruit in fruits) {
    print('- $fruit');
  }
}
