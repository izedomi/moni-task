import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moni/core/enums/loan_status.dart';
import 'package:moni/core/models/service_response.dart';
import 'package:http/http.dart' as http;
import 'package:moni/ui/shared/helpers/colors.dart';

class Utilities {
  static String dateFormatter(String date) {
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(date);
    String formatted = formatter.format(dateTime);
    var reformatDate = formatted.split("-");
    String formattedDate =
        reformatDate[2] + "-" + reformatDate[1] + "-" + reformatDate[0];

    //print(formattedDate);
    return formattedDate;
  }

  static String dateFormatter2(DateTime date) {
    var formatter = DateFormat('dd MMM yyyy');

    String formatted = formatter.format(date);

    //print(formattedDate);
    return formatted;
  }

  //e.g 23rd March, 2021
  static String dayWithSuffixMonthAndYear(DateTime date) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMM, y").format(date);
  }

  //e.g 23rd March, 2021 4:40PM
  static String d(DateTime date) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    String dd = DateFormat("d'$suffix' MMM, y").format(date);
    String tt = DateFormat.jm().format(date);

    return "$dd  $tt";
  }

  static String yearMonthDay(String date) {
    var reformatDate = date.split("-");
    String formattedDate =
        reformatDate[2] + "-" + reformatDate[1] + "-" + reformatDate[0];
    return formattedDate;
  }

  ///convert datetime format to Month, Day, Year and time
  static String monthDayYearAndTime(DateTime date) {
    return "${DateFormat.yMMMd().format(date)} ${DateFormat.jm().format(date)}";
  }

  ///convert datetime format to day and abbrev.month
  static String dayAndAbbrevMonth(DateTime date) {
    return "${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}";
  }

  static String time(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String hourTime(DateTime date) {
    return DateFormat.jm().format(date).split(" ")[0];
  }

  static String hourTimePeriod(DateTime date) {
    return DateFormat.jm().format(date).split(" ")[1];
  }

  ///initialize date-picker and format date picked
  static Future<dynamic> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1700),
        lastDate: DateTime(2100));
    if (picked != null) {
      return Utilities.dateFormatter(picked.toString());
    }
    return null;
  }

  ///formats large figures(eg 5000 -> 5k
  static String formatFigure({required double largeFigure}) {
    String _formattedNumber = NumberFormat.compact().format(largeFigure);
    return _formattedNumber;
  }

  ///format currency
  static String formatAmount({required double amount}) {
    final oCcy = NumberFormat("#,##0", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  // ///format currency
  // static String formatAmount({required double amount}) {
  //   final oCcy = NumberFormat("#,##0.00", "en_US");
  //   String formattedAmount = oCcy.format(amount);
  //   return formattedAmount;
  // }

  static String formatNumbers({required double amount}) {
    final oCcy = NumberFormat("#,##0", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  ///convert datetime format to Month and Year
  static String monthAndYear({required DateTime date}) {
    return DateFormat.yMMM().format(date);
  }

  ///convert datetime format to Month, Day and Year
  static String dateAndTime({required DateTime date}) {
    return DateFormat.yMMMd().format(date);
  }

  ///convert datetime format to Day/Month/Year
  static String dayMonthYear({required DateTime date}) {
    return "${DateFormat.d().format(date)}/${DateFormat.M().format(date)}/${DateFormat.y().format(date)}";
  }

  ///returns the number of days left
  static String daysLeft(
      {required DateTime expiryDate, required DateTime paymentDate}) {
    final difference = expiryDate.difference(paymentDate).inDays;
    return difference.toString();
  }

  static String timeAgo(DateTime date, {bool numericDates = true}) {
    if (date == null) {
      return 'Invalid date';
    }

    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years';
    } else if ((difference.inDays / 365).floor() == 1) {
      return numericDates ? '1 year' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return numericDates ? '1 month' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 week' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 hour' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 minute' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds';
    } else {
      return 'Just now';
    }
  }

  static String getInitials(String firstName, String lastName) {
    String initials = "";
    initials += firstName.substring(0, 1);
    initials += lastName.substring(0, 1);

    return initials.toUpperCase();
  }

  static String getInitialsFromFullname(String fullname) {
    String initials = "";
    String firstName;
    String lastName;

    List<String> names = fullname.split(" ");
    if (names.isNotEmpty) {
      firstName = names[0];
      initials += firstName.substring(0, 1);
    }
    if (names.length > 1) {
      lastName = names[1];
      initials += lastName.substring(0, 1);
    }

    return initials.toUpperCase();
  }

  static String capitalizeFirstWord(String text) {
    if (text.isEmpty) {
      return "";
    } else {
      final List<String> currentWord = text.trim().split(' ');
      List<String> newWord = [];

      for (int i = 0; i < currentWord.length; i++) {
        String word = currentWord[i].substring(0, 1).toUpperCase() +
            currentWord[i].substring(1).toLowerCase();

        newWord.add(word);
      }

      return newWord.join(" ");
    }
  }

  static String loanEmptyStateMessage(LoanStatus loanStatus) {
    switch (loanStatus) {
      case LoanStatus.overdue:
        return "No over due loans";
      case LoanStatus.dueToday:
        return "No loan is due today";
      case LoanStatus.active:
        return "0 active loans";
      default:
        return "0 inactive loans";
    }
  }

  static String loanDaysLeftMessage(DateTime date, LoanStatus loanStatus) {
    switch (loanStatus) {
      case LoanStatus.overdue:
        return Utilities.timeAgo(date) + " over due";
      case LoanStatus.dueToday:
        return "Due today";
      case LoanStatus.active:
        return Utilities.timeAgo(date) + " to due date";
      default:
        return "No loan";
    }
  }

  static String loanStatusMessage(LoanStatus loanStatus) {
    switch (loanStatus) {
      case LoanStatus.overdue:
        return "Late loan";
      case LoanStatus.dueToday:
        return "Late loan";
      case LoanStatus.active:
        return "Active loan";
      case LoanStatus.inactive:
        return "No loan";
      default:
        return "No loan";
    }
  }

  static Color mainLoanStatusColor(LoanStatus loanStatus) {
    switch (loanStatus) {
      case LoanStatus.overdue:
        return brightRed;
      case LoanStatus.dueToday:
        return goldYellow;
      case LoanStatus.active:
        return darkGreen;
      case LoanStatus.inactive:
        return darkGrey;
      default:
        return darkGrey;
    }
  }

  static Color subLoanStatusColor(LoanStatus loanStatus) {
    if (loanStatus == LoanStatus.active) {
      return ashGrey;
    }
    return mainLoanStatusColor(loanStatus);
  }

  static ServiceResponse parseResponse(http.Response res) {
    late dynamic response;
    if (res.statusCode == 200 || res.statusCode == 201) {
      try {
        response = json.decode(res.body.toString());

        //call is successful
        if (response["success"]) {
          return ServiceResponse(
              hasError: false,
              message: response["message"].toString(),
              data: response["data"] ?? "Success");
        }
        //something went wrong
        return ServiceResponse(
            hasError: true,
            message: response["message"].toString(),
            data: null);
      } catch (e) {
        //something went wrong
        return ServiceResponse(
          hasError: true,
          message: e.toString(),
        );
      }
    } else if (res.statusCode == 400) {
      response = json.decode(res.body.toString());
      return ServiceResponse(
          hasError: true,
          message:
              response["message"] ?? "Ooop. Bad request. Something went wrong");
    } else if (res.statusCode == 401) {
      response = json.decode(res.body.toString());
      return ServiceResponse(
          hasError: true,
          message: response["message"] ?? "Unauthorized. Access denied!!!");
    } else if (res.statusCode == 404) {
      response = json.decode(res.body.toString());
      return ServiceResponse(
          hasError: true,
          message: response["message"] ??
              "The resource you are looking for was not found!");
    } else {
      response = json.decode(res.body.toString());
      return ServiceResponse(hasError: true, message: response["message"]);
    }
  }
}
