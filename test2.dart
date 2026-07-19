// 2.5 Enum for Order Status
enum OrderStatus { pending, paid, cancelled }

// 2.5 Utility for Status message
String getStatusMessage(OrderStatus status) {
  return switch (status) {
    OrderStatus.pending => "รอชำระเงิน",
    OrderStatus.paid => "ชำระเงินแล้ว",
    OrderStatus.cancelled => "ยกเลิกคำสั่งซื้อ",
  };
}

// 2.1 Abstract Class
abstract class MenuItem {
  final String name;
  final double basePrice;

  // 2.5 Static member for counting objects
  static int itemCount = 0;

  MenuItem(this.name, this.basePrice) {
    itemCount++;
  }

  double price();

  void show() {
    print("$name - ${price()} บาท");
  }
}

// 2.2 Inheritance - Drink
class Drink extends MenuItem {
  final int toppings;

  Drink(String name, double basePrice, {required this.toppings})
      : super(name, basePrice);

  @override
  double price() => basePrice + (10 * toppings);
}

// 2.2 Inheritance - Food
class Food extends MenuItem {
  final String size;

  Food(String name, double basePrice, {required this.size})
      : super(name, basePrice);

  @override
  double price() {
    double multiplier = switch (size) {
      'S' => 1.0,
      'M' => 1.2,
      'L' => 1.5,
      _ => 1.0,
    };
    return basePrice * multiplier;
  }
}

// 2.4 Encapsulation - Wallet
class Wallet {
  double _balance = 0.0;

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      print("ผิดพลาด: ยอดเงินติดลบไม่ได้");
    } else {
      _balance = value;
    }
  }

  bool pay(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      return true;
    } else {
      print("ยอดเงินไม่พอ");
      return false;
    }
  }
}

void main() {
  // 2.3 Polymorphism
  List<MenuItem> order = [
    Drink("ลาเต้", 55.0, toppings: 1),
    Food("ข้าวผัด", 60.0, size: "M"),
    Drink("อเมริกาโน่", 45.0, toppings: 0),
  ];

  double total = 0;
  for (var item in order) {
    item.show();
    total += item.price();
  }
  print("ยอดรวมทั้งสิ้น : $total บาท");

  print("---");

  // 2.4 Testing Wallet
  Wallet myWallet = Wallet();
  myWallet.balance = -100; // Negative test
  myWallet.balance = 200;  // Valid set

  OrderStatus status = OrderStatus.pending;

  // Success pay
  if (myWallet.pay(100)) {
    print("ชำระเงินสำเร็จ");
    status = OrderStatus.paid;
  }
  print("สถานะ: ${getStatusMessage(status)}");
  print("ยอดคงเหลือ : ${myWallet.balance} บาท");

  // Insufficient funds
  if (!myWallet.pay(500)) {
    // Already printed "ยอดเงินไม่พอ" in method
  }
  print("สถานะ: ${getStatusMessage(status)}");
  print("ยอดคงเหลือ : ${myWallet.balance} บาท");

  print("---");

  // 2.5 Display static counter
  print("จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}");
}