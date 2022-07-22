import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/http/httpconnectuserprofile.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/screens/orders/orders_screen.dart';
import 'package:my_app/screens/user_profile/components/suffix_icon.dart';
import 'package:my_app/screens/user_profile/components/update_user_form.dart';
import 'package:my_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:all_sensors/all_sensors.dart';

bool _proximityValues = false;

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<User> futureUser;
  @override
  void initState() {
    super.initState();
    futureUser = HttpConnectUserProfile().getUserProfile();

    proximityEvents?.listen((ProximityEvent event) {
      setState(() {
        // event.getValue return true or false
        _proximityValues = event.getValue();
        if (_proximityValues) {
          exit(0);
        }
      });
    });
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
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(context, 16)),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(context, 20),
                      ),
                      FutureBuilder<User>(
                          future: futureUser,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return UpdateUserForm(
                                user: snapshot.data!,
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          }),
                      const SizedBox(height: 10),
                      Container(
                        // margin: const EdgeInsets.only(top: 25),
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () async {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.remove("token");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginScreen()));
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
