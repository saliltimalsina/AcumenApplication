// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return (SafeArea(
//       child: SizedBox(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 60, left: 30, bottom: 20),
//               child: Column(
//                 children: const [
//                   Text(
//                     "Welcome",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w300,
//                         fontSize: 36,
//                         color: Colors.white),
//                   ),
//                   Text("New user",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontSize: 36,
//                           color: Colors.white)),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Color(0xFF5497A7),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30))),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Sign-up",
//                         style: TextStyle(color: Colors.white, fontSize: 28),
//                       ),
//                       Center(
//                         child: Container(
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(40),
//                               color: Color(0XFFA1D2CE)),
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.photo_camera_rounded,
//                                 size: 40,
//                                 color: Colors.white,
//                               )),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Container(
//                           height: 390,
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: SignupForm()),
//                     ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
