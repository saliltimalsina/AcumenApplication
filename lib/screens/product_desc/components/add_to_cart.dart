import 'package:flutter/material.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/model/products.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/product_desc/components/increase_item.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, required this.product, required this.cartDao})
      : super(key: key);
  final Product product;
  final CartDAO cartDao;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          const IncreaseItem(),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      primary: Colors.orange),
                  onPressed: () async {
                    var cartProduct = await cartDao.getItemCartByUid(
                        UID, product.id.toString());
                    // ignore: unnecessary_null_comparison
                    if (cartProduct != null) {
                      cartProduct.quantity +=
                          1; //increase quantity if already exists in cart
                      await cartDao.updateCart(cartProduct);
                    } else {
                      Cart cart = Cart(
                          id: product.id.toString(),
                          uid: UID,
                          name: product.name.toString(),
                          category: product.category.toString(),
                          imageUrl: product.imageUrl.toString(),
                          price: product.price.toString(),
                          quantity: 1);
                      await cartDao.insertCart(cart);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
