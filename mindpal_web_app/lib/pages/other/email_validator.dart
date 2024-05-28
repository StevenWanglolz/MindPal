import 'package:flutter/material.dart';

class EmailValidator {
  static bool validate(String email) {
    // Basic email validation regex pattern
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$",
    );
    return regex.hasMatch(email);
  }
}
