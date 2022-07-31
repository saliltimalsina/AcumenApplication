import 'package:flutter/material.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.cartDAO})
      : super(key: key);
  final ProductModel product;
  final CartDAO cartDAO;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Image.network(
              "${product.imageUrl}",
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.all(6),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: int.parse("${product.oldPrice}") == 0
                                ? ''
                                : '\$${product.oldPrice}',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                        TextSpan(text: '\$${product.price}'),
                      ])),
                      GestureDetector(
                        onTap: () async {
                          var cartProduct = await cartDAO.getItemCartByUid(
                              UID, product.id.toString());
                          // ignore: unnecessary_null_comparison
                          if (cartProduct != null) {
                            cartProduct.quantity +=
                                1; //increase quantity if already exists in cart
                            await cartDAO.updateCart(cartProduct);
                          } else {
                            Cart cart = Cart(
                                id: product.id.toString(),
                                uid: UID,
                                name: product.name.toString(),
                                category: product.category.toString(),
                                imageUrl: product.imageUrl.toString(),
                                price: product.price.toString(),
                                quantity: 1);
                            await cartDAO.insertCart(cart);
                          }
                        },
                        child: Icon(Icons.shopping_cart),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
