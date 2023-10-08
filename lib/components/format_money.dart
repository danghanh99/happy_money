import 'package:intl/intl.dart';

class FormatMoney {
  static String formatTo(int value, String? locale) {
    var format1 = NumberFormat('#,##0', "vi_VND");
    String total = locale == null
        ? format1.format(value).toString()
        : format1.format(value).toString() + " " + locale;
    return total;
  }
}
