/// Utility functions for common tasks in Flutter applications.
///
/// This file contains functions for formatting dates, validating email addresses,
/// and checking phone numbers. These utilities are designed to be used throughout
/// a Flutter application to provide consistent functionality for these common tasks.
library utils;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Global key for accessing the Navigator state outside of the widget tree.
///
/// This key can be used to perform navigation actions from any part of the app
/// without having to pass the BuildContext around.
class Utils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

/// Formats a [DateTime] object into a string based on the provided [pattern].
///
/// This function uses the `intl` package to format dates. The [pattern] parameter
/// determines the format of the output string. For example, "yyyy-MM-dd" will
/// format the date into a string like "2023-01-01".
///
/// Parameters:
/// - [dateTime]: The DateTime object to format.
/// - [pattern]: The pattern to use for formatting the date.
///
/// Returns: A formatted date string.
String getFormattedDateTime(DateTime dateTime, String pattern) =>
    DateFormat(pattern).format(dateTime);

/// Validates an email address using a regular expression.
///
/// This function checks if the provided [email] string matches the pattern
/// for a valid email address. It returns true if the email is valid, false otherwise.
///
/// Parameters:
/// - [email]: The email address to validate.
///
/// Returns: `true` if the email is valid, `false` otherwise.
bool isEmail(String? email) {
  if (email == null) {
    return false;
  }

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(email);
}

/// Validates a phone number using a regular expression.
///
/// This function checks if the provided [phoneNumber] string matches the pattern
/// for a valid international phone number. It returns true if the phone number is valid,
/// false otherwise. The function also checks if the phone number has at least 10 digits.
///
/// Parameters:
/// - [phoneNumber]: The phone number to validate.
///
/// Returns: `true` if the phone number is valid, `false` otherwise.
bool isPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null) {
    return false;
  }
// Regular expression for international phone numbers.
  final RegExp phoneNumberRegex = RegExp(r'^(\+|00)?[0-9]+$');

  if (!phoneNumberRegex.hasMatch(phoneNumber)) {
    return false;
  }

  if (phoneNumber.length < 10) {
    return false;
  }

  return true;
}
