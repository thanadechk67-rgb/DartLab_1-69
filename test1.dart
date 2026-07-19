// 1.1 ค่าคงที่ระดับบนสุด
const double vatRate = 0.07;

// 1.4 ฟังก์ชันระดับบนสุด
double calcTotal({
  required int price,
  required int qty,
  double discount = 0,
}) {
  return (price * qty - discount) * (1 + vatRate);
}

void main() {
  // 1.1 ตัวแปรกำหนดค่าได้ครั้งเดียว
  final String shopName = "Dart Cafe";

  print("ร้าน: $shopName");
  print("อัตราภาษี (vatRate): $vatRate");

  print("---");

  // 1.2 List
  List<String> categories = [
    "เครื่องดื่ม",
    "ของคาว",
    "ของหวาน",
  ];

  // 1.2 Map
  Map<String, int> menu = {
    "อเมริกาโน": 45,
    "ลาเต้": 55,
    "ข้าวผัด": 60,
    "เค้ก": 50,
  };

  print("หมวดเมนู: $categories");
  print("จำนวนเมนูทั้งหมด: ${menu.length} รายการ");
  print("ราคาลาเต้: ${menu["ลาเต้"]} บาท");

  print("---");

  // 1.3 for-in และ if
  print("เมนูราคาตั้งแต่ 50 บาทขึ้นไป:");

  for (var item in menu.entries) {
    if (item.value >= 50) {
      print("${item.key} : ${item.value} บาท");
    }
  }

  print("---");

  // 1.4 เรียกใช้ฟังก์ชัน
  double total1 = calcTotal(
    price: 55,
    qty: 2,
  );

  double total2 = calcTotal(
    qty: 2,
    price: 55,
    discount: 10,
  );

  print("ยอดสุทธิ (ไม่มีส่วนลด): $total1 บาท");
  print("ยอดสุทธิ (ส่วนลด 10 บาท): $total2 บาท");

  print("---");

  // 1.5 Null Safety
  String? coupon;

  print("ความยาวคูปอง: ${coupon?.length ?? 0}");

  coupon ??= "NO-COUPON";

  print("คูปองหลังกำหนดค่า: $coupon");
}