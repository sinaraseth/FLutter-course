void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var studentPass = scores.where((score) => score >= 50);
  var count = studentPass.length;
  print(studentPass.toList());
  print('$count students passed');
}
