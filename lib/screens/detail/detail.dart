import 'package:flutter/material.dart';
import 'package:my_app/model/clothes.dart';
import 'package:my_app/screens/detail/components/add_cart.dart';
import 'package:my_app/screens/detail/components/clothes_info.dart';
import 'package:my_app/screens/detail/components/detail_appbar.dart';
import 'package:my_app/screens/detail/components/size_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.clothes}) : super(key: key);
  final Clothes clothes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(
              clothes: clothes,
            ),
            ClothesInfo(clothes: clothes),
            // const SizeList(),
            AddCart(clothes: clothes)
          ],
        ),
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final Clothes clothes;
//   const DetailPage(this.clothes);
//   @override
//   Widget build(BuildContext context) {
//     static String routename='/'
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [Text("detail")],
//         ),
//       ),
//     );
//   }
// }
