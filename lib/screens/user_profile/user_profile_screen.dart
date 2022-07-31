import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/components/appbar.dart';
import 'package:my_app/components/bottom_nav.dart';
import 'package:my_app/http/httpconnectuserprofile.dart';

import 'package:my_app/model/user.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/user_profile/components/body.dart';
import 'package:shake/shake.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/user_profile";

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNav(),
      appBar: buildAppBar(context, "Your Profile"),
    );
  }
}
