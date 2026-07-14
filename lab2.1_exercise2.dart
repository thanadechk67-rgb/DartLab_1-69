class Temperature {
  double _celsius = 0;

  double get celsius => _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      print("ไม่สามารถกำหนดอุณหภูมิต่ำกว่าศูนย์สัมบูรณ์ได้");
    } else {
      _celsius = value;
    }
  }

  double get fahrenheit => (_celsius * 9 / 5) + 32;
}

void main() {
  Temperature temp = Temperature();

  temp.celsius = 25;
  print("Celsius: ${temp.celsius}");
  print("Fahrenheit: ${temp.fahrenheit}");

  temp.celsius = -300;
}