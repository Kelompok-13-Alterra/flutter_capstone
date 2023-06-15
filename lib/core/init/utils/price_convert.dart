import 'package:intl/intl.dart';

String priceConvert(int price) {
  final priceFormat = NumberFormat('#,###,###');
  final formattedPrice = priceFormat.format(price);
  return formattedPrice;
}
