import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

import '../size_config.dart';



class DefaultButton extends StatelessWidget {
  
  const DefaultButton({
    Key? key, required this.text,required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(context,50),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          color: kPrimaryLightColor,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(context,18),
                color: Colors.white),
          )),
    );
  }
}