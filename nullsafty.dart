void printStringLength(String? maybeString) {
  // วิธีที่ 1: ตรวจสอบ Null
  if (maybeString != null) {
    print('Length (check): ${maybeString.length}');
  } else {
    print('String is null (check)');
  }

  // วิธีที่ 2: Conditional Member Access (?.)
  // ถ้า maybeString เป็น null, maybeString?.length จะเป็น null
  print('Length (?.): ${maybeString?.length}');

  // วิธีที่ 3: If Null Operator (??)
  // ถ้า maybeString?.length เป็น null, ให้ใช้ 0 แทน
  int length = maybeString?.length ?? 0;
  print('Length (??): $length');
}

// ตัวอย่าง late
class MyClass {
  late String description; // สัญญาว่าจะกำหนดค่าก่อนใช้

  void initialize() {
    description = 'Initialized Description';
  }

  void printDescription() {
    print(description); // ปลอดภัยถ้า initialize() ถูกเรียกก่อน
  }
}

void main() {
  printStringLength('Hello');
  print('---');
  printStringLength(null);
  print('---');

  String? nullableName;
  // print(nullableName.length); // <-- ข้อผิดพลาด! ต้องจัดการ null ก่อน
  // print(nullableName!.length); // <-- รันไทม์แครช! ถ้า nullableName เป็น null

  String nonNullableName;
  // print(nonNullableName); // <-- คอมไพล์เออร์เรอร์! ต้องกำหนดค่าก่อนใช้

  MyClass myObject = MyClass();
  myObject.initialize();
  myObject.printDescription(); // ทำงานได้
  // MyClass myObject2 = MyClass();
  // myObject2.printDescription(); // <-- รันไทม์แครช! เพราะยังไม่ได้ initialize
}