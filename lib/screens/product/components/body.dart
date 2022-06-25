import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/components/background-img.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/database/database.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/http/httpconnectuserprofile.dart';
import 'package:my_app/http/httpproducts.dart';
import 'package:my_app/model/products.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/addproduct/addproduct_screen.dart';
import 'package:my_app/screens/product/components/categories.dart';
import 'package:my_app/screens/product/components/item_card.dart';
import 'package:my_app/screens/product_desc/product_desc_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.cartDAO}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
  final CartDAO cartDAO;
}

class _BodyState extends State<Body> {
  late Future<User> futureUser;
  late Future<List<Product>> futureProduct;
  late final Product products;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    futureUser = HttpConnectUserProfile().getUserProfile();
    futureProduct = HttpConnectProduct().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   "Discover Books ",
              //   style: Theme.of(context).textTheme.headline5,
              // ),
              FutureBuilder<User>(
                  future: futureUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isAdmin == true) {
                        return ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddProductScreen.routeName);
                            },
                            child: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.green,
                                minimumSize: const Size(35, 35),
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(35)))));
                      } else {
                        return Spacer();
                      }
                    } else {
                      return Spacer();
                    }
                  }),
            ],
          ),
        ),
        // const Categories(),
        Expanded(
            child: FutureBuilder<List<Product>>(
          future: futureProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.69,
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding),
                  itemBuilder: (context, index) => ItemCard(
                      product: snapshot.data![index], cartDAO: widget.cartDAO),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ))
      ],
    );
  }
}
