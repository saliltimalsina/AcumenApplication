import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/database/database.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/addproduct/addproduct_screen.dart';
import 'package:my_app/screens/cart/cart_screen.dart';
import 'package:my_app/screens/cart_detail.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/forgotpassword.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:my_app/screens/orders/orders_screen.dart';
import 'package:my_app/screens/product/product_list_screen.dart';
import 'package:my_app/screens/signup/signup_screen.dart';
import 'package:my_app/screens/splash/splash_screen.dart';
import 'package:my_app/screens/user_profile/user_profile_screen.dart';
import 'package:my_app/screens/widgets/product_cart.dart';
import 'package:my_app/theme.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:my_app/wearos/wearosdashboard.dart';

import 'model/product_model.dart';
import 'wearos/wearoslogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      "resource://drawable/launcher", // icon for your app notification
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'my_app',
            channelName: 'my_jkl;app',
            channelDescription: "ACUMEN Notification",
            defaultColor: const Color(0xFF105F49),
            importance: NotificationImportance.Default,
            ledColor: Colors.white,
            enableLights: true,
            enableVibration: true)
      ]);

  final database =
      await $FloorAppDatabase.databaseBuilder('trendy_fits_cart').build();
  final dao = database.cartDAO;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dao}) : super(key: key);
  final CartDAO dao;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "qqqqqqqqqqq",
      // theme: theme(),
      theme: ThemeData(
        backgroundColor: bgcolor,
        primaryColor: primaycol,
        accentColor: accentcol,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: SplashScreen.routeName,
      initialRoute: "/wearos",

      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgotPassword.routename: (context) => const ForgotPassword(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProductList.routeName: (context) => ProductList(dao: dao),
        CartScreen.routeName: (context) => CartScreen(dao: dao),
        AddProductScreen.routeName: (context) => const AddProductScreen(),
        OrdersScreen.routeName: (context) => const OrdersScreen(),
        UserProfileScreen.routeName: (context) => const UserProfileScreen(),
        "/wearos": (context) => const WearOS_Login(),
        "/wearosdashboard": (context) => const WearOS_Dashboard(),
      },
    );
  }
}
