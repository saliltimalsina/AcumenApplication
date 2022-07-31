import 'package:flutter/material.dart';
import 'package:my_app/model/products.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${product.name} | ${product.category}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  '\$${product.price}',
                  style:const TextStyle(
                      color:Colors.white ,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
               
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '${product.rating} (2.5k)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${product.description}}',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.7), height: 1.5)),
            TextSpan(
                text: ' Read More',
                style: TextStyle(color: Theme.of(context).primaryColor))
          ]))
        ],
      ),
    );
  }
}
