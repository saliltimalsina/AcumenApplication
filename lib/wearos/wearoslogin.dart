import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wear/wear.dart';

class WearOS_Login extends StatefulWidget {
  const WearOS_Login({Key? key}) : super(key: key);
  @override
  State<WearOS_Login> createState() => _WearOS_LoginState();
}

class _WearOS_LoginState extends State<WearOS_Login> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<bool> loginPost(String uname, String pass) {
    var res = HttpConnectUser().loginPosts(uname, pass);
    return res;
  }

  _login() async {
    var res = await loginPost(_emailController.text, _passwordController.text);
    if (res) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', HttpConnectUser.token);
      Navigator.pushNamed(context, "/wearosdashboard");
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => const HomeScreen()));
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Login Fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(builder: (context, shape, child) {
      return AmbientMode(builder: (context, mode, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Acumen Login"),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              RaisedButton(
                  color: Colors.orange,
                  child: const Text("Login"),
                  onPressed: () {
                    _login();
                  }),
            ],
          ),
        ));
      });
    });
  }
}
