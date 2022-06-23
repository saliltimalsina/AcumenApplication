import 'package:flutter/material.dart';
import 'package:my_app/pallate.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName, required this.press,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: kBlue),
      child: FlatButton(
        onPressed:press,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}