import 'package:flutter/material.dart';
import 'package:my_app/model/Books.dart';

class BooksInfo extends StatelessWidget {
  final Books Books;
  const BooksInfo({Key? key, required this.Books}) : super(key: key);

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
              Text(
                '${Books.title} ${Books.subtitle}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ),
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
                  '4.5 ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    'Here are the original Sherlock Holmes stories by Arthur Conan Doyle as they first appeared in the famed British magazine The Strand. This periodical was the literary sensation of its time, especially with the publication of the novel The Hound of the Baskervilles',
                style: TextStyle(
                    color: Color.fromARGB(255, 55, 51, 51).withOpacity(0.7),
                    height: 1.5)),
            TextSpan(
                text: ' Read More',
                style: TextStyle(color: Theme.of(context).primaryColor))
          ]))
        ],
      ),
    );
  }
}
