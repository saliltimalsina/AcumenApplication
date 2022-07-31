import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/components/default_button.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/http/httporder.dart';
import 'package:my_app/model/cartmodel.dart';
import 'package:my_app/model/order.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/api/notification_api.dart';

import 'package:my_app/screens/cart/components/cart_item_card.dart';
import 'package:my_app/size_config.dart';

class Body extends StatefulWidget {
  Body({Key? key, required this.cartDao}) : super(key: key);
  final CartDAO cartDao;
  final List<CartModel> mycart = List.empty(growable: true);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.cartDao.getAllItemInCartByUid(UID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data as List<Cart>;
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(context, 20)),
                    child: ListView.builder(
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          widget.mycart.insert(
                            index,
                            CartModel(
                                id: items[index].id.toString(),
                                name: items[index].name,
                                imageUrl: items[index].imageUrl,
                                price: int.parse(items[index].price),
                                quantity: items[index].quantity),
                          );
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Dismissible(
                              key: Key(items[index].id.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) async {
                                await widget.cartDao.deleteCart(items[index]);
                              },
                              child: CartItemsCard(
                                cart: items[index],
                                cartDao: widget.cartDao,
                              ),
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFE6E6),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${items.length > 0 ? items.map<double>((m) => double.parse(m.price) * m.quantity).reduce((value, element) => value + element) : 0}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charge',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${items.length > 0 ? items.map<double>((m) => double.parse(m.price) * m.quantity).reduce((value, element) => value + element) * 0.1 : 0}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width:
                                    getProportionateScreenWidth(context, 120),
                                height:
                                    getProportionateScreenWidth(context, 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange,
                                ),
                                child: TextButton(
                                    onPressed: () async {
                                      Order myorder = Order(
                                          orderAmount: (items
                                                  .map<double>((m) =>
                                                      double.parse(m.price) *
                                                      m.quantity)
                                                  .reduce((value, element) =>
                                                      value + element)) +
                                              items
                                                  .map<double>((m) =>
                                                      double.parse(m.price))
                                                  .reduce((value, element) =>
                                                      value + element * 0.1),
                                          orderItems: widget.mycart);

                                      bool result = await HttpConnectOrder()
                                          .placeOrder(myorder);
                                      if (result) {
                                        MotionToast.success(
                                          description: const Text(
                                              'Order placed successfully'),
                                          toastDuration:
                                              const Duration(seconds: 1),
                                        ).show(context);
                                        AwesomeNotifications()
                                            .createNotification(
                                                content: NotificationContent(
                                          id: 1,
                                          channelKey: 'my_app',
                                          title: 'Order Placed',
                                          body:
                                              'Thanks for purchasing, your total bill is \$${myorder.orderAmount} ',
                                        ));
                                      }
                                    },
                                    child: const Text(
                                      "Checkout",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ))),
                            Text(
                              '\$${items.length > 0 ? (items.map<double>((m) => double.parse(m.price) * m.quantity).reduce((value, element) => value + element)) + items.map<double>((m) => double.parse(m.price)).reduce((value, element) => value + element) * 0.1 : 0}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: Text('Cart Detail Error'));
          }
        });
  }
}
