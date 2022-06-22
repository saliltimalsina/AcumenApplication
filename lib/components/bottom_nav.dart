import 'package:flutter/material.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/orders/orders_screen.dart';
import 'package:my_app/screens/user_profile/user_profile_screen.dart';

import '../screens/product/product_list_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom) *
            0.07,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()));
                break;
              case 1:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()));
                break;

              case 2:
                Navigator.pushNamed(context, "/mycart");
                break;

              case 3:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const OrdersScreen()));
                break;

              case 4:
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UserProfileScreen()));
                break;
            }
            // setState(() => currentIndex = index);
          },
          backgroundColor: Colors.orange,
          unselectedItemColor: Theme.of(context).secondaryHeaderColor,
          selectedItemColor: Colors.white,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home", backgroundColor: kBlue),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Products",
                backgroundColor: kBlue),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
                backgroundColor: kBlue),
            BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_rounded),
                label: "Orders",
                backgroundColor: kBlue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: "Profile",
                backgroundColor: kBlue),
          ],
        ),
      ),
    );
  }
}
