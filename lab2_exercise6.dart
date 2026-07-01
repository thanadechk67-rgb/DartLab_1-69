int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

void printValue(int val) => print('Value: $val');

void executeOperation(int a, int b, int Function(int, int) operation) {
  var result = operation(a, b);
  print('Result: $result');
}

double rectangle(double x, double y) => x * y;
double triangle(double x, double y) => 0.5 * x * y;
double circle(double r) => 3.14 * r * r;

void main() {
  executeOperation(10, 5, add);          // Result: 15
  executeOperation(10, 5, subtract);     // Result: 5
  executeOperation(10, 5, (x, y) => x * y); // Result: 50

  print(rectangle(10, 5)); // 50.0
  print(triangle(10, 5));  // 25.0
  print(circle(5));        // 78.5
}