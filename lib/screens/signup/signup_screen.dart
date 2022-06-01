import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/background-img.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/screens/signup/components/body.dart';
import 'package:my_app/screens/signup/components/register_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(imgPath: "assets/images/signup-bg.jpg"),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: size.width * 0.1,
              ),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey[400]!.withOpacity(0.4),
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: kWhite,
                            size: size.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    left: size.width * 0.56,
                    child: Container(
                      height: size.width * 0.09,
                      width: size.width * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: kWhite, width: 2),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.arrowUp,
                        color: kWhite,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.1,
              ),
              RegisterForm()
            ]),
          ),
        )
      ],
    );
  }
}
