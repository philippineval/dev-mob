void method(int a, [int? b, int? c]) {
  print('a=$a, b=$b, c=$c');
}

void main() {
  method(0);
  method(0, 1);
  method(0, null);
  method(0, 1, 4);
}
