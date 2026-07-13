Future<void> main() async {
  print("1. เริ่ม");

  await Future.delayed(Duration(seconds: 3));

  print("2. โหลดเสร็จ");
  print("3. จบ");
}