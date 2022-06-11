import 'package:flutter/material.dart';
import 'package:my_app/model/Books.dart';
import 'package:my_app/screens/detail/components/add_cart.dart';
import 'package:my_app/screens/detail/components/Books_info.dart';
import 'package:my_app/screens/detail/components/detail_appbar.dart';
import 'package:my_app/screens/detail/components/size_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.Books}) : super(key: key);
  final Books Books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(
              Books: Books,
            ),
            BooksInfo(Books: Books),
            AddCart(Books: Books)
          ],
        ),
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final Books Books;
//   const DetailPage(this.Books);
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
