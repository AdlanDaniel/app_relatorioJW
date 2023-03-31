import 'package:flutter/material.dart';

class AuthPublisherValidator {
  AuthPublisherValidator._();

  static FormFieldValidator comparePassword(
      TextEditingController valueEC, String message) {
    return (value) {
      final valueCompare = valueEC.text;
      if (value != valueCompare) {
        return message;
      }
      return null;
    };
  }
}
