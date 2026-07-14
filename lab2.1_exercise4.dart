abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard implements PaymentMethod {
  @override
  void pay(double amount) {
    print("ชำระเงิน $amount บาท ผ่านบัตรเครดิต");
  }
}

class PromptPay implements PaymentMethod {
  @override
  void pay(double amount) {
    print("ชำระเงิน $amount บาท ผ่าน PromptPay");
  }
}

class CashOnDelivery implements PaymentMethod {
  @override
  void pay(double amount) {
    print("ชำระเงิน $amount บาท แบบเก็บเงินปลายทาง");
  }
}

void main() {
  List<PaymentMethod> methods = [
    CreditCard(),
    PromptPay(),
    CashOnDelivery(),
  ];

  for (var method in methods) {
    method.pay(999);
  }
}