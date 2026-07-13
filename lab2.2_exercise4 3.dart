Stream<String> countdown(int from) async* {
  for (int i = from; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));

    if (i == 0) {
      yield "หมดเวลา!";
    } else {
      yield i.toString();
    }
  }
}

Future<void> main() async {
  await for (String value in countdown(5)) {
    print(value);
  }
}