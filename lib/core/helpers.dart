import 'package:intl/intl.dart';

class AppHelpers {
  // ------------------- PRICE FORMATTING -------------------
  static String formatPrice(double price) {
    final formatCurrency = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatCurrency.format(price);
  }

  // ------------------- DATE FORMATTING -------------------
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  // ------------------- STRING UTILITIES -------------------
  static String capitalize(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }

  // ------------------- VALIDATORS -------------------
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6; // simple example
  }
}
