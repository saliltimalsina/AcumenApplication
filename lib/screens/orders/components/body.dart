import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/http/httporder.dart';
import 'package:my_app/model/cartmodel.dart';
import 'package:my_app/model/order.dart';

import 'package:my_app/screens/user_profile/user_profile_screen.dart';
import 'package:my_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Order> orders = List<Order>.empty(growable: true);

  late Future<List<Order>> futureOrder;
  double total = 0.0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    futureOrder = HttpConnectOrder().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder<List<Order>>(
              future: futureOrder,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: getProportionateScreenHeight(context, 20),
                          ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return OrderSection(order: snapshot.data![index]);
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              // child:const Center(child: Text("Thanks for shopping !!!",style: const TextStyle(fontSize: 16, fontWeight:FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
}

class OrderSection extends StatelessWidget {
  const OrderSection({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: order.orderItems.length,
      itemBuilder: (context, index) {
        return (OrderCard(cart: order.orderItems[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: getProportionateScreenHeight(context, 20),
        );
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(context, 15),
          left: getProportionateScreenWidth(context, 15),
          right: getProportionateScreenWidth(context, 15)),
      height: getProportionateScreenWidth(context, 110),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context,
              //     ProductDetailsPage.routeName);
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(cart.imageUrl)),
                  borderRadius: BorderRadius.circular(10)),
              height: double.infinity,
              width: double.infinity,
            ),
          )),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Quantity x ${cart.quantity}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$${cart.price}',
                          style: TextStyle(color: kPrimaryColor),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Cash on delivery",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              // color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
