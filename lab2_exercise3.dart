void main() {
  List<String> Subject = ['Math',"Sci","Cal"];
  print ("All subject is : ${Subject.length}");
  print (Subject[0]);
  
  Subject.add ("Eng");
  print ('First Subject is : ${Subject[0]}');
  print ('Last Subject is : ${Subject.last}') ;
  print (Subject);
  
  Map<String,int> StudentScores = { 'Math': 83,
                                    'Eng' : 95 
                                   };
  print ('English score is : ${StudentScores['Eng']}');
  
  StudentScores["Sci"] = 90 ;
  StudentScores["Cal"] = 91 ;
  print (StudentScores);




}


  