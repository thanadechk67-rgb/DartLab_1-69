import 'dart:async';

void main() {
  StreamController<String> controller =
      StreamController<String>();

  controller.stream.listen(
    (message) {
      print("แจ้งเตือน: $message");
    },
    onDone: () {
      print("ปิดระบบแจ้งเตือนแล้ว");
    },
  );

  controller.add("มีข้อความใหม่");
  controller.add("มีผู้ติดตามใหม่");
  controller.add("อัปเดตระบบสำเร็จ");

  controller.close();
}