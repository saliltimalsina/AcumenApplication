import 'package:my_app/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Scaffold",
    textTheme: myTextTheme(),
    primarySwatch: Colors.blue,
    // inputDecorationTheme: inputDecorationTheme()
  );
}

// InputDecorationTheme inputDecorationTheme() {
//   OutlineInputBorder outlineInputBorder = OutlineInputBorder(
//             borderRadius: BorderRadius.circular(28),
//             borderSide: const BorderSide(color: kTextColor),
//             gapPadding: 10);
//   return InputDecorationTheme(

//     floatingLabelBehavior: FloatingLabelBehavior.always,

//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
//         enabledBorder: outlineInputBorder,
//         focusedBorder: outlineInputBorder,
//         border: outlineInputBorder
//   );
// }

TextTheme myTextTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Color(0XFF95D5B2),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Color(0XFF004346), fontSize: 18),
  );
}
