String reverseString(String str) {
  return str.split('').reversed.join();
}

class Witch {
  int number;

  Witch({required this.number});

  String crushLights() {
    String crush3 = "13121";
    String crush4 = "21412" + crush3;

    //Base Cases
    if (number == 3) return crush3;
    if (number == 4) return crush4;

    //Initializing a list of strings
    //Each string consists of some number representing the order of toggling lights
    List<String> crushingList = List.filled(number + 1, '');
    crushingList[3] = crush3;
    crushingList[4] = crush4;

    //Filling the string using bottom-up approach
    for (int i = 5; i <= number; i++) {
      crushingList[i] = crushingList[i - 2] +
          i.toString() +
          reverseString(crushingList[i - 2]) +
          crushingList[i - 1];
    }

    return crushingList[number];
  }
}
