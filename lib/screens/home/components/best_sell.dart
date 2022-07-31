import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/home/components/categories_list.dart';

class BestSell extends StatelessWidget {
  const BestSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesList(title: "Best Selling"),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/arrival1.jpg",
                          width: 80,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Adventures of Sherlock Holmes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          Text(
                            "- By Arthur Conan Doyle",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          Text(
                            "\$79.99",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.9)),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
