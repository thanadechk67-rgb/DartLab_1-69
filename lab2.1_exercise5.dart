mixin Loggable {
  void log(String msg) {
    print("[${DateTime.now()}] $msg");
  }
}

class Stack<T> with Loggable {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
    log("Push: $item");
  }

  T? pop() {
    if (_items.isEmpty) {
      log("Stack ว่าง");
      return null;
    }

    T item = _items.removeLast();
    log("Pop: $item");
    return item;
  }

  void show() {
    print(_items);
  }
}

void main() {
  Stack<int> stack = Stack<int>();

  stack.push(10);
  stack.push(20);
  stack.push(30);

  stack.show();

  stack.pop();
  stack.show();
}