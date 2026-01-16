void main() {
  int? a;
  int b = a ?? 5;

  /*int c = a!; // fait cracher à l'éxecution donc on a enlevé
  print(c);
*/
  if (a == null) {
    a = 3;
  }

  print(a.isEven); /*ne compilait pas*/
}