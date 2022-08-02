import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/http/httpproducts.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/model/products.dart';
import 'package:my_app/model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("Add Product test", () {
    late HttpConnectProduct pro;
    setUp(() {
      // pro = HttpConnectProduct();
    });
    test("Add Product", () async {
      // pro = HttpConnectProduct();
      bool expectedResult = true;
      Product user = Product(
          name: "testiang",
          price: 12,
          description: "testiaang",
          category: "testing",
          imageUrl: "https://fivebooks.com/app/uploads/books/BC_0141040289.jpg",
          rating: 4);
      bool actualResult = await HttpConnectProduct().addProducts(user, null);
      expect(expectedResult, actualResult);
    });
  });
}
  // test("user login",() async{
  //   bool expectedResult = true;
  //   bool actualResult =  await UserRepository().login( "raj1232","Soft@12342");
  //   expect(expectedResult,actualResult);
  // });
  // });
  // tearDown((){
  //   userRepository = null;
  // });

// import 'package:flutter_test/flutter_test.dart';
// import 'package:my_app/http/httpproducts.dart';
// import 'package:my_app/http/httpuser.dart';
// import 'package:my_app/model/user.dart';

// void main() {
//   group("user api test", () {
//     late HttpConnectProduct pro;
//     setUp(() {
//       pro = HttpConnectProduct();
//     });
//     test("user login", () async {
//       bool expectedResult = true;
//       bool actualResult =
//           await HttpConnectUser().loginPosts("saliltimal", "qwerty");
//       expect(expectedResult, actualResult);
//     });
//   });
//   // tearDown((){
//   //   HttpConnectUser= null;
//   // });
// }
