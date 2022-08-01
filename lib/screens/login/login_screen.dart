import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/rounded-btn.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/login/components/body.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/screens/login/components/login_form.dart';
import 'package:my_app/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          imgPath: "assets/images/login-bg.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            child: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      'ACUMEN',
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                  ),
                ),
                LoginForm(),
                Container(
                  child: GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: Text(
                    "Create New Account",
                    style: kBodyText,
                  )),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: kWhite)),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
// gg