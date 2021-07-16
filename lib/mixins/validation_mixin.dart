import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ValidationMixin {
  MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Please Enter Email'),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Please Enter a Valid Email')
  ]);

  MultiValidator passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Please Enter Password'),
    MinLengthValidator(6,
        errorText: 'password should be at least 6 characters'),
  ]);

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String? checkPassword(String? value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  String? checkEmail(String? value) {
    //return null if valid
    if (value == null || value.isEmpty) {
      return "Please Enter Email";
    }
    if (!emailValid.hasMatch(value)) {
      return "Please Enter a valid Email";
    }

    return null;
  }

  Widget toast(String message, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
