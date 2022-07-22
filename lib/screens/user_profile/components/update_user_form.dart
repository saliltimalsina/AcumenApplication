import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/http/httpconnectuserprofile.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/screens/user_profile/components/suffix_icon.dart';
import 'package:my_app/screens/user_profile/user_profile_screen.dart';
import 'package:my_app/size_config.dart';
import 'package:shake/shake.dart';

class UpdateUserForm extends StatefulWidget {
  const UpdateUserForm({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUsername = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();

  void refresh() {
    Navigator.pop(context);
    Navigator.pushNamed(context, UserProfileScreen.routeName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerUsername.text = widget.user.username!;
    _controllerEmail.text = widget.user.email!;
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      refresh();
      MotionToast.success(description: Text("Successfully refreshed"))
          .show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const PrefixIcon(icon: Icons.account_circle),
              Expanded(
                child: TextFormField(
                  controller: _controllerUsername,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: getProportionateScreenWidth(context, 15),
                          left: getProportionateScreenWidth(context, 10)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 4, color: Colors.white)),
                      hintText: "username",
                      suffixIcon: const SuffixIcon()),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(context, 20),
          ),
          Row(
            children: [
              const PrefixIcon(
                icon: Icons.mail_rounded,
              ),
              Expanded(
                child: TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 4, color: Colors.white)),
                    hintText: 'babu.raja@gmail.com',
                    contentPadding: EdgeInsets.only(
                        top: getProportionateScreenWidth(context, 15),
                        left: getProportionateScreenWidth(context, 10)),
                    suffixIcon: const SuffixIcon(),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(context, 20),
          ),
          Row(
            children: [
              const PrefixIcon(
                icon: Icons.location_on_rounded,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 4, color: Colors.white)),
                    hintText: 'Imadol, Lalitpur',
                    contentPadding: EdgeInsets.only(
                        top: getProportionateScreenWidth(context, 15),
                        left: getProportionateScreenWidth(context, 10)),
                    suffixIcon: const SuffixIcon(),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(context, 20),
          ),
          Text(
            "Security",
            style:
                TextStyle(fontSize: getProportionateScreenWidth(context, 16)),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: getProportionateScreenHeight(context, 20),
          ),
          Row(
            children: [
              const PrefixIcon(
                icon: Icons.vpn_key,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const SuffixIcon(),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 4, color: Colors.white)),
                    hintText: 'Change Password',
                    contentPadding: EdgeInsets.only(
                        top: getProportionateScreenWidth(context, 15),
                        left: getProportionateScreenWidth(context, 10)),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            // margin: const EdgeInsets.only(top: 25),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {
                updateUser();
              },
              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void updateUser() async {
    String username = _controllerUsername.text;
    String email = _controllerEmail.text;
    User user = User(email: email, username: username);
    bool res = await HttpConnectUserProfile().updateUserProfile(user);

    if (res) {
      MotionToast.success(description: const Text("Updated sucessfully"));
    }
  }
}

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 45,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),
      child: Icon(
        icon,
        size: 32,
      ),
    );
  }
}
