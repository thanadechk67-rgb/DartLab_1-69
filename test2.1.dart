// q2_oop.dart

abstract class MenuItem {
  final String name;
  final double basePrice;

  static int itemCount = 0;

  MenuItem(this.name, this.basePrice) {
    itemCount++;
  }

  double price();

  void show() {
    print("$name - ${price()} บาท");
  }
}

class Drink extends MenuItem {
  int toppings;

  Drink(String name, double basePrice, this.toppings)
      : super(name, basePrice);

  @override
  double price() {
    return basePrice + (10 * toppings);
  }
}

class Food extends MenuItem {
  String size;

  Food(String name, double basePrice, this.size)
      : super(name, basePrice);

  @override
  double price() {
    double multiplier;

    switch (size) {
      case "S":
        multiplier = 1.0;
        break;
      case "M":
        multiplier = 1.2;
        break;
      case "L":
        multiplier = 1.5;
        break;
      default:
        multiplier = 1.0;
    }

    return basePrice * multiplier;
  }
}

class Wallet {
  double _balance;

  Wallet(this._balance);

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      print("ผิดพลาด: ยอดเงินติดลบไม่ได้");
      return;
    }
    _balance = value;
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

enum OrderStatus {
  pending,
  paid,
  cancelled,
}

void showStatus(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      print("สถานะ: รอชำระเงิน");
      break;
    case OrderStatus.paid:
      print("สถานะ: ชำระเงินแล้ว");
      break;
    case OrderStatus.cancelled:
      print("สถานะ: ยกเลิกคำสั่งซื้อ");
      break;
  }
}

void main() {
  List<MenuItem> order = [
    Drink("ลาเต้", 55, 1),
    Food("ข้าวผัด", 60, "L"),
    Drink("อเมริกาโน่", 45, 0),
  ];

  double total = 0;

  for (MenuItem item in order) {
    item.show();
    total += item.price();
  }

  print("ยอดรวมทั้งสิ้น: $total บาท");

  print("---");

  Wallet wallet = Wallet(300);

  wallet.balance = -100;

  if (wallet.pay(total)) {
    print("ชำระเงินสำเร็จ");
    showStatus(OrderStatus.paid);
    print("ยอดคงเหลือ: ${wallet.balance} บาท");
  }

  if (!wallet.pay(150)) {
    showStatus(OrderStatus.pending);
    print("ยอดคงเหลือ: ${wallet.balance} บาท");
  }

  print("---");
  print("จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}");
}