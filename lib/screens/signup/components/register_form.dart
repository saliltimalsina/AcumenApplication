import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/http/httpuser.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String username = '';
  String password1 = '';
  String password2 = '';

  Future<bool> registerUser(User u) {
    var res = HttpConnectUser().registerPost(u);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFormHeight = size.height * 0.08;
    double textFormWidth = size.width * 0.8;

    var boxDecoration = BoxDecoration(
      color: Colors.grey[500]!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
    );

    return Form(
      key: _formKey,
      child: Column(
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
                child: _buildEmailForm(),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: textFormHeight,
              width: textFormWidth,
              decoration: boxDecoration,
              child: Center(
                child: _buildConfirmPasswordForm(),
              ),
            ),
          ),
          SizedBox(
            
            height: 25,
          ),
          RoundedButton(
            key: const Key('register'),
            buttonName: "Register",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                User u = User(
                  username: username,
                  email: email,
                  password: password1,
                );
                bool isCreated = await registerUser(u);
                if (isCreated) {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                  // MotionToast.success(description: Text('New user created'))
                  //     .show(context);
                } else {
                  MotionToast.error(description: Text('Failed to create user'))
                      .show(context);
                }
                // Navigator.pushNamed(context, LoginSucessScreen.routeName);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?", style: kBodyText),
              GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, LoginScreen.routeName),
                  child: Text(
                    "Login",
                    style: kBodyText.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  TextFormField _buildUsernameForm() {
    return TextFormField(
      key: const Key("username"),
      onSaved: (value) => username = value!,
      decoration: _textInputDecoration("Username", FontAwesomeIcons.user),
      style: kBodyText,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildEmailForm() {
    return TextFormField(
      key: const Key("email"),
      validator: RequiredValidator(errorText: "*required"),
      onSaved: (value) => email = value!,
      decoration: _textInputDecoration("Email", FontAwesomeIcons.envelope),
      style: kBodyText,
      keyboardType: TextInputType.emailAddress,
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
      onSaved: (value) => password1 = value!,
      decoration: _textInputDecoration(
        "Password",
        FontAwesomeIcons.lock,
      ),
      style: kBodyText,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildConfirmPasswordForm() {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      onSaved: (value) => password2 = value!,
      decoration: _textInputDecoration(
        "Confirm Password",
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
