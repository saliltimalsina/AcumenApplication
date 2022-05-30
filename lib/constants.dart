import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF52B788);
const kPrimaryLightColor = Color(0XFF95D5B2);
const kPrimaryGrandientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0XFFFFA53E),
      Color(0XFFFF7643),
    ]);
const kSecondaryColor = Colors.white;
const kTextColor = Color(0XFF5497A7);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Errors
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const kDefaultPadding = 20.0;

///=========api================
String ip2 = '192.168.1.64';
String ip1 = '10.0.2.2';
