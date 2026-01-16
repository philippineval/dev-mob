void main () {
  List<int> list = [25,42, 79, 12];
  list.sort((int a, int b){
    return b.compareTo(a);
  });


print(list);

list.map((int el) {
  return el*2;
});

print(list);


}