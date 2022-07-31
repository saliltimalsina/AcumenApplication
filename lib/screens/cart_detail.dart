import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({Key? key, required this.cartDAO}) : super(key: key);
  final CartDAO cartDAO;

  @override
  _CartDetailState createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Detail"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: StreamBuilder(
          stream: widget.cartDAO.getAllItemInCartByUid(UID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<Cart>;
              return Column(children: [
                // ignore: unnecessary_null_comparison
                Expanded(
                    child: ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  child: Image(
                                    image: NetworkImage(items[index].imageUrl),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Text(
                                          items[index].name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.monetization_on,
                                              color: Colors.grey,
                                              size: 16,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                items[index].price,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: ElegantNumberButton(
                                  initialValue: items[index].quantity,
                                  buttonSizeHeight: 20,
                                  buttonSizeWidth: 25,
                                  color: Colors.white38,
                                  minValue: 0,
                                  maxValue: 100,
                                  decimalPlaces: 0,
                                  onChanged: (value) async {
                                    items[index].quantity =
                                        int.parse(value.toString());
                                    await widget.cartDAO
                                        .updateCart(items[index]);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      key: Key(items[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        await widget.cartDAO.deleteCart(items[index]);
                      },
                    );
                  },
                )),
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
                              '\$${items.length > 0 ? items.map<double>((m) => double.parse(m.price)* m.quantity).reduce((value, element) => value + element) * 0.1 : 0}',
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
                            Text(
                              'Sub Total',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${items.length > 0 ? (items.map<double>((m) => double.parse(m.price)* m.quantity).reduce((value, element) => value + element)) + items.map<double>((m) => double.parse(m.price)).reduce((value, element) => value + element) * 0.1 : 0}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]);
            } else {
              return Center(child: Text('Cart Detail Error'));
            }
          },
        ));
  }
}
