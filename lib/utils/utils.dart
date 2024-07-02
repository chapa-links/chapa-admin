import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '__utils.dart';

class Utils {
  static String generateReferralCode(String uid) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String randomString = String.fromCharCodes(Iterable.generate(
        3, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    return uid.substring(0, 3) + randomString;
  }

  static String generateRandomDocIDs() {
    var uuid = const Uuid();
    return uuid.v4();
  }

  static String generateRandomNumberString() {
    Random random = Random.secure();
    String randomString = "";
    for (var i = 0; i < 8; i++) {
      randomString += random.nextInt(10).toString();
    }
    return randomString;
  }

  static String getTimestamp() => DateTime.now().toIso8601String();

  bool isIso8601(String date) {
    RegExp iso8601RegExp =
        RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$');
    return iso8601RegExp.hasMatch(date);
  }

  String formatDate(String date) {
    if (date.isEmpty) return "";
    DateTime parsedDate = DateTime.parse(date);
    String daySuffix = _getDaySuffix(parsedDate.day);
    String formattedDate =
        DateFormat('d\'$daySuffix\' MMM. yyyy').format(parsedDate);
    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String formatDateWithDay(String date) {
    if (date.isEmpty) return "";
    DateTime parsedDate = DateTime.parse(date);
    String daySuffix = _getDaySuffix(parsedDate.day);
    String formattedDate =
        DateFormat('EEEE, d\'$daySuffix\' MMMM yyyy').format(parsedDate);
    return formattedDate;
  }

  String displayDateTime(String date) {
    if (date.isEmpty) return "____";
    DateTime parsedDate = DateTime.parse(date);
    String daySuffix = _getDaySuffix(parsedDate.day);
    String formattedDate =
        DateFormat('d\'$daySuffix\' MMM. yyyy - hh:mm a').format(parsedDate);
    return formattedDate;
  }

  static String formatAmount(String? amount, {bool withSign = true}) {
    if (amount == null) {
      return amount.toString();
    } else {
      double value = double.parse(amount);
      final formatter = NumberFormat("#,##0", "en_US");
      String formattedAmount = formatter.format(value);
      return withSign ? "${AppStrings.naira}$formattedAmount" : formattedAmount;
    }
  }

  static String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inMinutes < 1) {
      return 'a moment ago';
    } else if (difference.inHours < 1) {
      final minutes = difference.inMinutes;
      return '$minutes min${minutes == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 1) {
      final hours = difference.inHours;
      return '$hours hr${hours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days day${days == 1 ? '' : 's'} ago';
    } else {
      final days = difference.inDays;
      return '$days day${days == 1 ? '' : 's'} ago';
      // return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  static List<String> generateMonthList(int givenMonth) {
    int currentMonth = givenMonth;

    List<String> initialList = [];
    if (currentMonth <= 12) {
      initialList = [
        for (currentMonth; currentMonth <= 12; currentMonth++)
          currentMonth.toString()
      ];
    }
    currentMonth = 1;
    while (initialList.length < 12) {
      initialList.add(currentMonth.toString());
      currentMonth++;
    }
    return initialList;
  }

  static const Map<String, String> monthsMap = {
    "1": "Jan",
    "2": "Feb",
    "3": "Mar",
    "4": "Apr",
    "5": "May",
    "6": "Jun",
    "7": "Jul",
    "8": "Aug",
    "9": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec"
  };
}
