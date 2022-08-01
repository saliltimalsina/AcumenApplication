import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/pallate.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static String routename = "/forgotpassword";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(imgPath: "assets/peakpx.jpg"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kWhite,
                )),
            title: Text(
              "Forgot password",
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Text(
                    'Enter your email we will send instruction to reset your password',
                    style: kBodyText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                EmailInputField(
                  icon: FontAwesomeIcons.envelope,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  buttonName: 'Send',
                  press: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
