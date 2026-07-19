void main() {
double vatRate = 0.07;
String shopName = "Dart cafe";
print ('อัตราภาษี : ${vatRate}');
print('ร้าน : ${shopName}');
print("---");



List<String> categories  = ["cake","smooty","fruit"];
var bath = {
    "cake" : 40,
    "smooty" : 50,
    "fruit" : 100,

};
print('หมวดหมู่ : ${categories}');
print('จำนวนทั้งหมด : ${categories.length}');
print(bath ['cake']);
print("---");



}

//อัตราภาษี : 0.07
//ร้าน : Dart cafe
//---
//หมวดหมู่ : [cake, smooty, fruit]
//จำนวนทั้งหมด : 3
//40
//---
