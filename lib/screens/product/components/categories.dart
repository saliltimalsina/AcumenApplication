// import 'package:flutter/material.dart';
// import 'package:my_app/constants.dart';
// import 'package:my_app/size_config.dart';

// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   List<String> categories = [
//     "Handbag",
//     "Jwelllery",
//     "FootWear",
//     "Dresses",
//     "Shoes"
//   ];
//   int selectedindex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
//       child: SizedBox(
//         height: getProportionateScreenHeight(context, 25),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) => buildCategory(index),
//         ),
//       ),
//     );
//   }

//   Widget buildCategory(int index) => GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedindex = index;
//           });
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 categories[index],
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: selectedindex == index
//                         ? kTextColor
//                         : kPrimaryLightColor),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: kDefaultPadding / 4),
//                 height: 2,
//                 width: 30,
//                 color: selectedindex == index
//                     ? Color(0XFF004346)
//                     : Colors.transparent,
//               )
//             ],
//           ),
//         ),
//       );
// }
