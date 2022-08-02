import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/database/database.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/main.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/routes.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Login successful", (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      routes: {HomeScreen.routeName: (context) => const HomeScreen()},
      home: const LoginScreen(),
    ));
    Finder txtFirst = find.byKey(const ValueKey("email"));
    await tester.enterText(txtFirst, "ingit.dost@gmail.com");
    Finder txtSecond = find.byKey(const ValueKey("password"));
    await tester.enterText(txtSecond, "12345678");
    Finder btnAdd = find.byKey(const ValueKey("login"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
  testWidgets("Register Sucesfully", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/register': (context) => const SignUpScreen()},
      home: const SignUpScreen(),
    ));
    Finder txtFirst = find.byKey(const ValueKey("username"));
    await tester.enterText(txtFirst, "Bakis");
    Finder txtSecond = find.byKey(const ValueKey("email"));
    await tester.enterText(txtSecond, "nitesh.manjil@gmail.com");
    Finder txtThird = find.byKey(const ValueKey("password"));
    await tester.enterText(txtThird, "1234567899");
    Finder btnAdd = find.byKey(const ValueKey("register"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
  testWidgets("Dashboard", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {LoginScreen.routeName: (context) => const LoginScreen()},
      home: const HomeScreen(),
    ));
    Finder btnAdd = find.byKey(const ValueKey("register"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.text("ShopWisely"), findsOneWidget);
  });

  testWidgets("Dashboardfind", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/register': (context) => const SignUpScreen()},
      home: const SignUpScreen(),
    ));
    Finder btnAdd = find.byKey(const ValueKey("login"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.text("All electronic\n accessories\n in one hand"),
        findsOneWidget);
  });
}
