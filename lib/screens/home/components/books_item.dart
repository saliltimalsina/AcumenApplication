import 'package:flutter/material.dart';
import 'package:my_app/model/Books.dart';
import 'package:my_app/screens/detail/detail.dart';

class BooksItem extends StatelessWidget {
  const BooksItem({Key? key, required this.Books}) : super(key: key);
  final Books Books;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>DetailPage( Books: Books,))
            );
          },
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(Books.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    right: 20,
                    top: 15,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ))
              ],
            ),
            Text(
              Books.title,
              style: productTextStyle(),
            ),
            Text(Books.subtitle, style: productTextStyle()),
            Text(Books.price, style: priceTextStyle(context))
          ],
              ),
            ),
        ));
  }

  TextStyle productTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        height: 1.5,
        );
  }

   TextStyle priceTextStyle(context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: Theme.of(context).primaryColor);
  }
}

