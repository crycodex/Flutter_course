import 'package:intl/intl.dart';

class NumFormat {


  static String numberFormat(double number){
    final formatter = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: "",
    ).format(number);

    return formatter;

  }

}