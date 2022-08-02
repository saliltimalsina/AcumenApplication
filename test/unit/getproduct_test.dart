import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/http/httpproducts.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/model/products.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("get product details list", () {
    late HttpConnectProduct pro;
    setUp(() {
      pro = HttpConnectProduct();
    });
    test("get product details", () async {
      pro = HttpConnectProduct();
      bool expectedResult = true;
      bool actualResult = false;
      var result = await HttpConnectProduct().getProducts();
      if (result !=  null) {
        actualResult = true;
      }
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
