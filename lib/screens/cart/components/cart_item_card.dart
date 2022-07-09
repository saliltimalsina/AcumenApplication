import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/pallate.dart';

import 'package:my_app/size_config.dart';

class CartItemsCard extends StatelessWidget {
  const CartItemsCard({
    Key? key,
    required this.cart,
    required this.cartDao,
  }) : super(key: key);
  final CartDAO cartDao;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(context, 88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(cart.imageUrl), fit: BoxFit.cover),
                color: Color(0xFFF5F6f9),
                borderRadius: BorderRadius.circular(15),
              ),
              // child: Image.asset(cart.clothes.imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(context, 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 120,
              child: Text(
                cart.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text.rich(
              TextSpan(
                  text: "\$${cart.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: "x${cart.quantity}",
                        style: TextStyle(color: Colors.grey))
                  ]),
            )
          ],
        ),
        Spacer(),
        Center(
          child: IncreaseItemBtn(cart: cart, cartDao: cartDao),
        )
      ],
    );
  }
}

class IncreaseItemBtn extends StatefulWidget {
  const IncreaseItemBtn({
    Key? key,
    required this.cart,
    required this.cartDao,
  }) : super(key: key);
  final CartDAO cartDao;
  final Cart cart;

  @override
  State<IncreaseItemBtn> createState() => _IncreaseItemBtnState();
}

class _IncreaseItemBtnState extends State<IncreaseItemBtn> {
  @override
  Widget build(BuildContext context) {
    return ElegantNumberButton(
      initialValue: widget.cart.quantity,
      buttonSizeHeight: 20,
      buttonSizeWidth: 25,
      color: Colors.grey,
      minValue: 0,
      maxValue: 100,
      decimalPlaces: 0,
      onChanged: (value) async {
        widget.cart.quantity = int.parse(value.toString());
        await widget.cartDao.updateCart(widget.cart);
      },
    );
  }
}
