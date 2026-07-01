void main(){
String? middleName;
String city = 'Nakhon Sawan';
int middleNamelenght = middleName?.length ?? 0;
print ('middle name lenght : $middleNamelenght');
  
print ('city length is : ${city.length}');

print ('middle name bf :  $middleName');

middleName ??= "Null";
print ("middle name after : $middleNamelenght");















}