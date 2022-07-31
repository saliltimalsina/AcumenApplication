import 'package:flutter/material.dart';
import 'package:my_app/size_config.dart';

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.edit,
      color: Colors.orange,
      size: getProportionateScreenWidth(context, 18),
    );
  }
}
