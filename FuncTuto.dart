String say(String from, String msg, [String? device]) {
  return '$from says $msg${device != null ? ' with a $device' : ''}';
}
// เรียกใช้:
void main() {
print (say('Bob', 'Howdy?')); // Bob says Howdy?
print (say('Alice', 'Hi!', 'smartphone')); // Alice says Hi! with a smartphone
}