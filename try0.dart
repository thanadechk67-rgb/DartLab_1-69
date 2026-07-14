1. Class + Constructor + Method
class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void showInfo() {
    print("ชื่อ: $name");
    print("อายุ: $age");
  }
}

void main() {
  Student s = Student("Mark", 20);
  s.showInfo();
}
2. Getter + Setter + Validation (ออกบ่อยมาก)
class BankAccount {
  double _balance = 0;

  double get balance {
    return _balance;
  }

  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }
}

void main() {
  BankAccount acc = BankAccount();

  acc.balance = 1000;

  print(acc.balance);
}
3. Inheritance + super
class Animal {
  String name;

  Animal(this.name);
}

class Dog extends Animal {

  Dog(String name) : super(name);

  void bark() {
    print("$name Woof");
  }
}
4. Override + Polymorphism (ออกแทบแน่นอน)
class Animal {
  void sound() {
    print("Animal");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Meow");
  }
}

void main() {

  List<Animal> animals = [
    Dog(),
    Cat(),
  ];

  for (Animal a in animals) {
    a.sound();
  }
}
5. Abstract Class (โอกาสออกสูง)
abstract class Shape {

  double area();

  void show() {
    print("Shape");
  }
}

class Circle extends Shape {

  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}
6. Static (ชอบออกเป็นตัวนับ Object)
class Student {

  static int count = 0;

  Student() {
    count++;
  }
}

void main() {

  Student();
  Student();
  Student();

  print(Student.count);
}
7. Enum + Switch
enum Status {
  pending,
  shipped,
  delivered
}

void main() {

  Status status = Status.shipped;

  switch (status) {

    case Status.pending:
      print("Pending");
      break;

    case Status.shipped:
      print("Shipped");
      break;

    case Status.delivered:
      print("Delivered");
      break;
  }
}
8. Named Parameters
void showUser({
  required String name,
  int age = 18,
}) {
  print(name);
  print(age);
}

void main() {

  showUser(
    name: "Mark",
    age: 20,
  );
}
9. List
void main() {

  List<String> fruits = [
    "Apple",
    "Banana",
    "Orange"
  ];

  print(fruits.length);

  for (String fruit in fruits) {
    print(fruit);
  }
}
10. Map
void main() {

  Map<String,int> scores = {
    "Math":80,
    "English":90,
  };

  print(scores["Math"]);

  for (var entry in scores.entries) {
    print("${entry.key} ${entry.value}");
  }

  for (String key in scores.keys) {
    print(key);
  }
}
11. Null Safety
void main() {

  String? name;

  print(name);

  print(name?.length);

  print(name ?? "Guest");

  name ??= "Mark";

  print(name);
}
12. Future.delayed ลำดับการทำงาน
void main() {

  print("A");

  Future.delayed(
    Duration(seconds:1),
    () {
      print("B");
    },
  );

  print("C");
}

Output

A
C
B
13. async await
Future<void> main() async {

  print("Start");

  await Future.delayed(
    Duration(seconds:2),
  );

  print("Finish");
}
14. throw Exception
Future<String> fetchUser(int id) async {

  if (id <= 0) {
    throw Exception("Invalid ID");
  }

  return "Mark";
}
15. try catch finally
Future<void> main() async {

  try {

    String user = await fetchUser(1);

    print(user);

  } catch (e) {

    print(e);

  } finally {

    print("Finish");
  }
}
16. Stream + yield (ออกได้สูงมาก)
Stream<int> countdown(int from) async* {

  for (int i = from; i >= 1; i--) {

    await Future.delayed(
      Duration(seconds:1),
    );

    yield i;
  }
}

Future<void> main() async {

  await for (
    int value in countdown(5)
  ) {
    print(value);
  }

  print("หมดเวลา");
}

```dart
// ================================
// Dart Summary (บท 2 + 2.1 + 2.2)
// ================================

// ---------- ENUM ----------
enum Status {
  pending,
  shipped,
  delivered
}

// ---------- ABSTRACT CLASS ----------
abstract class Employee {
  String name;

  Employee(this.name);

  // เมธอดนามธรรม (ไม่มีเนื้อหา)
  double calculateSalary();

  // เมธอดปกติ
  void showInfo() {
    print("ชื่อ: $name");
  }
}

// ---------- INHERITANCE ----------
class FullTimeEmployee extends Employee {
  double salary;

  // super ส่งค่าให้ constructor ของคลาสแม่
  FullTimeEmployee(String name, this.salary) : super(name);

  // override เมธอดจากคลาสแม่
  @override
  double calculateSalary() {
    return salary;
  }
}

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

// ---------- ENCAPSULATION ----------
class BankAccount {
  // private field
  double _balance = 0;

  // getter
  double get balance => _balance;

  // setter พร้อม validation
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }
}

// ---------- STATIC ----------
class Student {
  static int count = 0;

  String name;

  Student(this.name) {
    count++;
  }
}

// ---------- CLASS & OBJECT ----------
class Book {
  String title;
  String author;
  double price;

  // constructor แบบย่อ
  Book(
    this.title,
    this.author,
    this.price,
  );

  void showDetail() {
    print("$title โดย $author ราคา $price บาท");
  }
}

// ---------- FUNCTION ----------
int add(int a, int b) {
  return a + b;
}

// Named Parameter + required + default value
void showUser({
  required String name,
  int age = 18,
}) {
  print("ชื่อ $name อายุ $age");
}

// ---------- FUTURE ----------
Future<String> fetchUser(int id) async {
  // จำลองการโหลดข้อมูล
  await Future.delayed(
    Duration(seconds: 2),
  );

  // Exception
  if (id <= 0) {
    throw Exception("Invalid User ID");
  }

  return "Thanadech";
}

// ---------- STREAM ----------
Stream<int> countdown(int from) async* {
  for (int i = from; i >= 1; i--) {
    await Future.delayed(
      Duration(seconds: 1),
    );

    // ส่งค่าทีละตัว
    yield i;
  }
}

// ================================
// MAIN
// ================================

Future<void> main() async {

  // ---------- DATA TYPES ----------
  int age = 20;
  double height = 175.5;
  String name = "Thanadech";
  bool isStudent = true;

  // final และ const
  final currentTime = DateTime.now();
  const pi = 3.14159;

  // String interpolation
  print("ชื่อ $name");
  print("อายุ ${age + 1}");

  // ---------- LIST ----------
  List<String> fruits = [
    "Apple",
    "Banana",
    "Orange"
  ];

  print(fruits.length);

  for (String fruit in fruits) {
    print(fruit);
  }

  // ---------- MAP ----------
  Map<String, int> scores = {
    "Math": 80,
    "English": 90,
  };

  print(scores["Math"]);

  for (var entry in scores.entries) {
    print("${entry.key}: ${entry.value}");
  }

  // ---------- NULL SAFETY ----------
  String? nickname;

  print(nickname);

  // ?. เรียกเมื่อไม่เป็น null
  print(nickname?.length);

  // ?? ใช้ค่าด้านขวาถ้า null
  print(nickname ?? "Guest");

  // ??= กำหนดค่าเมื่อยังเป็น null
  nickname ??= "Mark";

  // ---------- IF ELSE ----------
  if (age >= 18) {
    print("Adult");
  } else {
    print("Child");
  }

  // ---------- SWITCH ----------
  Status status = Status.shipped;

  switch (status) {
    case Status.pending:
      print("Pending");
      break;

    case Status.shipped:
      print("Shipped");
      break;

    case Status.delivered:
      print("Delivered");
      break;
  }

  // ---------- FUNCTION ----------
  print(add(5, 3));

  showUser(
    name: "Mark",
    age: 20,
  );

  // ---------- CLASS ----------
  Book book = Book(
    "Dart Programming",
    "John",
    350,
  );

  book.showDetail();

  // ---------- GET / SET ----------
  BankAccount account = BankAccount();

  account.balance = 1000;

  print(account.balance);

  // ---------- STATIC ----------
  Student("A");
  Student("B");

  print(Student.count);

  // ---------- POLYMORPHISM ----------
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
    print(e.calculateSalary());
  }

  // ---------- ASYNC / AWAIT ----------
  try {
    String user = await fetchUser(1);

    print(user);
  }
  catch (e) {
    print(e);
  }
  finally {
    print("จบการโหลดข้อมูล");
  }

  // ---------- STREAM ----------
  await for (
    int number
    in countdown(5)
  ) {
    print(number);
  }

  print("หมดเวลา");
}
```
