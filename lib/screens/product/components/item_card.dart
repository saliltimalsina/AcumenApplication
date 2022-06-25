import 'package:flutter/material.dart';
import 'package:my_app/const/const.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/dao/CartDAO.dart';
import 'package:my_app/entity/cart.dart';
import 'package:my_app/model/products.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/product_desc/product_desc_screen.dart';


class ItemCard extends StatefulWidget {
  final CartDAO cartDAO;
  // final Future<List<Product>> product;
  final Product product;
  // final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.cartDAO,
    // required this.press,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    String? _imageUrl = widget.product.imageUrl;

    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductDescScreen(product: widget.product,cartDao:widget.cartDAO)));
              },
              child: Container(
                // height: 180,
                // width: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage("${widget.product.imageUrl}"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding / 4),
            child: Text(
              "${widget.product.name}",
              style: TextStyle(color: accentcol),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.product.price}",
                style: TextStyle(color: primaycol, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () async {
                  var cartProduct = await widget.cartDAO
                      .getItemCartByUid(UID, widget.product.id.toString());
                  // ignore: unnecessary_null_comparison
                  if (cartProduct != null) {
                    cartProduct.quantity +=
                        1; //increase quantity if already exists in cart
                    await widget.cartDAO.updateCart(cartProduct);
                  } else {
                    Cart cart = Cart(
                        id: widget.product.id.toString(),
                        uid: UID,
                        name: widget.product.name.toString(),
                        category: widget.product.category.toString(),
                        imageUrl: widget.product.imageUrl.toString(),
                        price: widget.product.price.toString(),
                        quantity: 1);
                    await widget.cartDAO.insertCart(cart);
                  }
                },
                child: Icon(Icons.shopping_cart),
              )
            ],
          )
        ],
      ),
    );
  }
}
