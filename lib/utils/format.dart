class Format {
  static String formatNumber(int number) {
    if (number.isNaN) {
      return "0";
    }
    if (number < 1000) {
      return number.toString();
    }
    String stringNumber;
    Map<int, String> sign = {1000: "K", 1000000: "M", 1000000000: "B"};
    int index;
    if (number >= sign.keys.elementAt(0) && number < sign.keys.elementAt(1)) {
      index = 0;
    } else if (number <= sign.keys.elementAt(2)) {
      index = 1;
    } else {
      index = 2;
    }
    var tmp =
        (number / sign.keys.elementAt(index)).toDouble().toStringAsFixed(1);
    stringNumber = "$tmp${sign.values.elementAt(index)}";
    return stringNumber;
  }
}
