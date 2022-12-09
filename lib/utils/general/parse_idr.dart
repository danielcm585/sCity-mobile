import 'package:intl/intl.dart';

String parseIdr(amount) {
  final oCcy = NumberFormat("#,##0.00", "en_US");
  return "IDR ${oCcy.format(amount)}";
}