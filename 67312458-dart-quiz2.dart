abstract class MenuItem {
	final String name;
	final double basePrice;

	MenuItem(this.name, this.basePrice);

	double price();

	void show() {
		final p = price();
		print('$name - ${p.toStringAsFixed(2)} บาท');
  	print('ยอดรวมทั้งสิ้น - ${p.toStringAsFixed(2)} บาท');
    print('---');
	}
}

class FoodItem extends MenuItem {
	final double extra;
	FoodItem(String name, double basePrice, {this.extra = 0}) : super(name, basePrice);

	@override
	double price() => basePrice + extra;
}

void main() {
	final sushi = FoodItem('ซูชิ', 120.0, extra: 10.5);
	final salad = FoodItem('สลัด', 85.0);

	sushi.show();
	salad.show();
}

class drink extends MenuItem {
double toppings;
drink(String name, double basePrice, {this.toppings = 0}) : super(name, basePrice);

@override
double price() =>  basePrice + (10 * toppings)
;
  
}

class food extends MenuItem {



}
//ซูชิ - 130.50 บาท
//ยอดรวมทั้งสิ้น - 130.50 บาท
//---
//สลัด - 85.00 บาท
//ยอดรวมทั้งสิ้น - 85.00 บาท
//---