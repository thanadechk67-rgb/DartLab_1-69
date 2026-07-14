DART QUIZ CHEAT SHEET

====================
พื้นฐาน
=======

ชนิดข้อมูล

* int
* double
* String
* bool

ค่าคงที่

* final = กำหนดค่าตอนรันได้ครั้งเดียว
* const = ค่าคงที่ตั้งแต่คอมไพล์

String Interpolation

* $name
* ${age + 1}

List

* list.length
* list[index]
* for (var item in list)

Map

* map["key"]
* map.entries
* map.keys

Null Safety

* String? name
* name?.length
* name ?? "Guest"
* name ??= "Guest"

เงื่อนไข

* if / else
* switch / case
* for-in

Named Parameter

* required
* ค่าเริ่มต้น age = 18

ตัวอย่าง

void show({
required String name,
int age = 18,
})

====================
OOP
===

Class

class Student {
String name;
int age;

Student(this.name,this.age);

void showInfo() {
print(name);
}
}

Object

Student s = Student("Mark",20);

---

Private Field

double _balance = 0;

Getter

double get balance {
return _balance;
}

Setter

set balance(double value) {
if(value >= 0){
_balance = value;
}
}

---

Inheritance

class Dog extends Animal {
Dog(String name)
: super(name);
}

จำให้ได้:
extends + super

---

Override

@override
void sound() {
print("Woof");
}

---

Polymorphism

List<Animal> animals = [
Dog(),
Cat(),
];

for(Animal a in animals){
a.sound();
}

---

Abstract

abstract class Shape {
double area();

void show(){
print("Shape");
}
}

สร้าง Object ไม่ได้

Shape s = Shape(); ❌

---

Static

static int count = 0;

เรียกผ่านชื่อคลาส

Student.count

---

Enum

enum Status {
pending,
shipped,
delivered
}

ใช้กับ switch

====================
ASYNC
=====

Future

Future<String>

---

Future.delayed

print("A");

Future.delayed(
Duration(seconds:1),
(){
print("B");
}
);

print("C");

Output

A
C
B

---

async await

Future<void> main() async {

await Future.delayed(
Duration(seconds:2),
);

print("Done");
}

---

Exception

throw Exception(
"Invalid ID"
);

---

try catch finally

try {

}
catch(e){

}
finally{

}

---

Stream

Stream<int> countdown(
int from
) async* {

yield 5;
}

รับข้อมูล

await for(
int n in countdown(5)
){
print(n);
}

====================
12 KEYWORDS
===========

class
constructor
this
extends
super
@override
abstract
static
enum
async
await
yield

====================
เดาแนวข้อสอบ
============

ข้อ 1

* List
* Map
* Function
* Named Parameter
* Enum + Switch

ข้อ 2

* Abstract
* extends
* super
* override
* getter/setter
* static
* polymorphism

ข้อ 3

* Future.delayed
* async await
* Exception
* try catch finally
* Stream
* yield

1) OOP ข้อใหญ่สุด (50 คะแนน)
Abstract + Inheritance + Override + Polymorphism + super
// abstract = ห้ามสร้าง object จากคลาสนี้โดยตรง
abstract class Employee {

  String name;

  // constructor ของคลาสแม่
  Employee(this.name);

  // เมธอดนามธรรม ลูกต้อง override
  double calculateSalary();

  // เมธอดปกติ
  void showInfo() {
    print("ชื่อพนักงาน: $name");
  }
}

// พนักงานประจำ
class FullTimeEmployee extends Employee {

  double monthlySalary;

  // super ส่งค่าให้ constructor ของ Employee
  FullTimeEmployee(
    String name,
    this.monthlySalary,
  ) : super(name);

  // override = เขียนทับเมธอดเดิม
  @override
  double calculateSalary() {
    return monthlySalary;
  }
}

// พนักงานพาร์ทไทม์
class PartTimeEmployee extends Employee {

  int hours;
  double rate;

  PartTimeEmployee(
    String name,
    this.hours,
    this.rate,
  ) : super(name);

  @override
  double calculateSalary() {
    return hours * rate;
  }
}

void main() {

  // Polymorphism
  // List ประกาศเป็น Employee
  // แต่เก็บ object ลูกได้
  List<Employee> employees = [
    FullTimeEmployee(
      "John",
      30000,
    ),
    PartTimeEmployee(
      "Jane",
      80,
      150,
    ),
  ];

  for (Employee e in employees) {
    e.showInfo();

    // Dynamic Dispatch
    // เรียก calculateSalary ของคลาสลูกอัตโนมัติ
    print(
      e.calculateSalary(),
    );
  }
}

🔥 ถ้าออกแนวนี้ทำได้คือเก็บคะแนน OOP ไปเกินครึ่งแล้ว

2) Getter Setter
อาจารย์ชอบออก Validation
class Temperature {

  // private field
  double _celsius = 0;

  // getter
  double get celsius {
    return _celsius;
  }

  // setter
  set celsius(
    double value,
  ) {

    // validation
    if (
      value >= -273.15
    ) {
      _celsius = value;
    }
  }

  // getter คำนวณค่าใหม่
  double get fahrenheit {
    return (
      _celsius * 9 / 5
    ) + 32;
  }
}

โจทย์มักมาแนว

ห้ามอายุติดลบ
ห้ามเงินติดลบ
ห้ามอุณหภูมิต่ำกว่า 0
3) Static
class Student {

  // ใช้ร่วมกันทั้งคลาส
  static int count = 0;

  String name;

  Student(
    this.name,
  ) {
    count++;
  }
}

void main() {

  Student("A");
  Student("B");
  Student("C");

  // เรียกผ่านชื่อคลาส
  print(
    Student.count,
  );
}
4) Enum + Switch
enum OrderStatus {

  pending,
  shipped,
  delivered,
  cancelled
}

void main() {

  OrderStatus status =
      OrderStatus.shipped;

  switch(status) {

    case OrderStatus.pending:
      print(
        "รอดำเนินการ",
      );
      break;

    case OrderStatus.shipped:
      print(
        "กำลังจัดส่ง",
      );
      break;

    case OrderStatus.delivered:
      print(
        "จัดส่งสำเร็จ",
      );
      break;

    case OrderStatus.cancelled:
      print(
        "ยกเลิก",
      );
      break;
  }
}
5) Future + async await
ออกเกือบแน่นอน
Future<String>
fetchUser() async {

  // จำลองโหลดข้อมูล
  await Future.delayed(
    Duration(
      seconds: 2,
    ),
  );

  return "Thanadech";
}

Future<void>
main() async {

  print(
    "เริ่มโหลดข้อมูล",
  );

  String user =
      await fetchUser();

  print(user);

  print(
    "โหลดเสร็จ",
  );
}
6) Exception
ออกได้สูงมาก
Future<String>
fetchUser(
  int id,
) async {

  if (id <= 0) {

    // โยนข้อผิดพลาด
    throw Exception(
      "Invalid ID",
    );
  }

  return "John";
}

Future<void>
main() async {

  try {

    String user =
      await fetchUser(
        0,
      );

    print(user);

  }

  // ดักจับ error
  catch(e) {

    print(
      "Error: $e",
    );
  }

  // ทำงานเสมอ
  finally {

    print(
      "จบการทำงาน",
    );
  }
}
7) Stream + yield
ถ้าออก Async ใหญ่ มีโอกาสสูงมาก
Stream<int>
countdown(
  int from,
) async* {

  for(
    int i = from;
    i >= 1;
    i--
  ) {

    await Future.delayed(
      Duration(
        seconds:1,
      ),
    );

    // ส่งค่าทีละตัว
    yield i;
  }
}

Future<void>
main() async {

  // รับค่าทีละตัว
  await for(
    int number
      in countdown(5)
  ) {

    print(number);
  }

  print(
    "หมดเวลา",
  );
}
8) Map + List
ตัวเต็งของข้อ 1
void main() {

  List<
    Map<
      String,
      dynamic
    >
  > students = [

    {
      "name":"Mark",
      "score":80,
    },

    {
      "name":"John",
      "score":90,
    },
  ];

  for(
    var student
      in students
  ) {

    print(
      "${student["name"]}"
    );

    print(
      "${student["score"]}"
    );
  }
}
9) Named Parameter
void register({

  required String name,

  int age = 18,

}) {

  print(name);

  print(age);
}

void main() {

  register(

    name:"Mark",

    age:20,
  );
}
