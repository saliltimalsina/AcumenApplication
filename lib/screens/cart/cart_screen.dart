import 'package:flutter/material.dart';
import 'package:my_app/components/appbar.dart';
import 'package:my_app/components/default_button.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/model/cartmodel.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/cart/components/body.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/size_config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required this.dao}) : super(key: key);
  static String routeName = '/mycart';
  final CartDAO dao;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Your Cart"),
      body: Body(cartDao: dao),
    
    );
  }

  AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    foregroundColor: Theme.of(context).accentColor,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.white,
    title: Column(
      children: [
        Text(title),
      ],
    ),
  );
}


}

