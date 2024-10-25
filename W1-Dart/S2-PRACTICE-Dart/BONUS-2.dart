void main() {
  print(checkBalance("{what is (42)}?"));
  print(checkBalance("[text}"));
  print(checkBalance("{[[(a)b]c]d}"));
}

bool isBalanced(String b) {
  List<String> stack = [];

  Map<String, String> bracketMap = {')': '(', '}': '{', ']': '['};

  for (int i = 0; i < b.length; i++) {
    String char = b[i];

    if (bracketMap.containsValue(char)) {
      stack.add(char);
    } else if (bracketMap.containsKey(char)) {
      if (stack.isEmpty || stack.removeLast() != bracketMap[char]) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

String checkBalance(String s) {
  return isBalanced(s) ? "Balanced" : "Not balanced";
}

