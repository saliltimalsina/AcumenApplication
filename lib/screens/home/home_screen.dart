import 'package:flutter/material.dart';
import 'package:my_app/components/bottom_nav.dart';
import 'package:my_app/model/books.dart';
import 'package:my_app/screens/home/components/best_sell.dart';
import 'package:my_app/screens/home/components/categories_list.dart';
import 'package:my_app/screens/home/components/books_item.dart';
import 'package:my_app/screens/home/components/myappbar.dart';
import 'package:my_app/screens/home/components/new_arrival.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final bottomList = ['home', 'menu', 'heart', 'user'];
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(),
              NewArrival(),
              BestSell(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}
