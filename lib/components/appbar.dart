import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home_screen.dart';

import '../pallate.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    foregroundColor: Theme.of(context).accentColor,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen()));
      },
    ),
    backgroundColor: Colors.white,
    title: Column(
      children: [
        Text(title),
      ],
    ),
  );
}
