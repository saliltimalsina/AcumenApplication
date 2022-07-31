import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginForm = GlobalKey<FormState>();
  int counter = 1;
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    // checkLogin();
    _checkNotificationEnabled();
    super.initState();
  }

  String username = '';

  String password = '';

  Future<bool> loginPost(String uname, String pass) {
    var res = HttpConnectUser().loginPosts(uname, pass);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFormHeight = size.height * 0.08;
    double textFormWidth = size.width * 0.8;

    var boxDecoration = BoxDecoration(
      color: Color.fromARGB(255, 144, 51, 39)!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
    );
    return Form(
      key: loginForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: textFormHeight,
              width: textFormWidth,
              decoration: boxDecoration,
              child: Center(
                child: _buildUsernameForm(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: textFormHeight,
              width: textFormWidth,
              decoration: boxDecoration,
              child: Center(
                child: _buildPasswordForm(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ForgotPassword.routename),
            child: const Text(
              "Forgot Password",
              style: kBodyText,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: size.height * 0.08,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.orange,
            ),
            child: FlatButton(
              key: const Key('login'),
              onPressed: () async {
                if (loginForm.currentState!.validate()) {
                  loginForm.currentState!.save();

                  var res = await loginPost(username, password);
                  if (res) {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString('token', HttpConnectUser.token);
                    // Navigator.pushNamed(context, HomeScreen.routeName);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen()));
                    MotionToast.success(
                      description: const Text('Login Successfull'),
                      toastDuration: const Duration(seconds: 1),
                    ).show(context);
                    // AwesomeNotifications().createNotification(
                    //     content: NotificationContent(
                    //         id: counter,
                    //         channelKey: 'myapp',
                    //         title: 'Notification_title',
                    //         body: 'hahahahahahhaha'));
                    // setState(() {
                    //   counter++;
                    // });
                  } else {
                    MotionToast.error(
                            description: const Text('Login UnSuccessfull'))
                        .show(context);
                  }
                }
              },
              child: Text(
                "Login",
                style: kBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  TextFormField _buildUsernameForm() {
    return TextFormField(
      validator: RequiredValidator(errorText: "*required"),
      key: const Key("username"),
      onSaved: (value) => username = value!,
      decoration: _textInputDecoration("Username", FontAwesomeIcons.user),
      style: kBodyText,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildPasswordForm() {
    return TextFormField(
      validator: RequiredValidator(errorText: "*required"),
      key: const Key("password"),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      onSaved: (value) => password = value!,
      decoration: _textInputDecoration(
        "Password",
        FontAwesomeIcons.lock,
      ),
      style: kBodyText,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  InputDecoration _textInputDecoration(String hint, IconData icon) {
    return InputDecoration(
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
        hintStyle: kBodyText);
  }
}
