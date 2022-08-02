import 'package:all_sensors/all_sensors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/http/httpconnectuserprofile.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../screens/user_profile/components/update_user_form.dart';

class WearOS_Dashboard extends StatefulWidget {
  const WearOS_Dashboard({Key? key}) : super(key: key);

  @override
  State<WearOS_Dashboard> createState() => _WearOS_DashboardState();
}

class _WearOS_DashboardState extends State<WearOS_Dashboard> {
  late Future<User> futureUser;
  @override
  void initState() {
    super.initState();
    futureUser = HttpConnectUserProfile().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/peakpx.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 40,
                      height: 80,
                      width: 80,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/profile.png'))),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      left: 130,
                      child: FutureBuilder<User>(
                          future: futureUser,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!.username.toString(),
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(
                                        context, 16),
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor),
                              );
                            } else {
                              return const Text("Unknown");
                            }
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(context, 10),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: []),
              )
            ],
          )
        ],
      ),
    );
  }
}
