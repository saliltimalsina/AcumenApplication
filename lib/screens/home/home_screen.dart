import 'package:flutter/material.dart';
import 'package:my_app/components/bottom_nav.dart';
import 'package:my_app/model/clothes.dart';
import 'package:my_app/screens/home/components/best_sell.dart';
import 'package:my_app/screens/home/components/categories_list.dart';
import 'package:my_app/screens/home/components/clothes_item.dart';
import 'package:my_app/screens/home/components/myappbar.dart';
import 'package:my_app/screens/home/components/new_arrival.dart';
import 'package:my_app/screens/home/components/search_input.dart';

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
              // SearchInput(),
              NewArrival(),
              BestSell(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}
