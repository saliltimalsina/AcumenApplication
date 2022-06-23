import 'package:flutter/material.dart';
import 'package:my_app/pallate.dart';



class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28,
                    color: kWhite,
                  ),
                ),
                hintStyle: kBodyText),
            obscureText: true,
            keyboardType: inputType,
            style: kBodyText,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
