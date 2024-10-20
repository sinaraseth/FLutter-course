void main(List<String> args) {
  List<int> number = [1, 2, 3, 5, 6, 8, 7, 10, 40, 7];
  // print(number.indexOf(7));
  for (int i = 0; i < number.length; i++) {
    // if (number[i] == 7 && number[i] == null) {
    if (number[i] == 7 && number[i] == null) {
      print('Index of 7 is : $i');
    }
  }
}
