import 'package:flutter/material.dart';
import 'package:my_app/model/clothes.dart';
import 'package:my_app/screens/home/components/categories_list.dart';
import 'package:my_app/screens/home/components/clothes_item.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clothesList = Clothes.generateClothes();
    return Container(
      child: Column(
        children: [
          CategoriesList(title: "New Arrival"),
          Container(
            height: 280,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ClothesItem(clothes: clothesList[index]),
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: clothesList.length),
          )
        ],
      ),
    );
  }
}
