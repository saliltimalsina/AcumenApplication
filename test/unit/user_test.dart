import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group("user api test", () {
    late final HttpConnectUser usr;
    setUp(() {
      usr = HttpConnectUser();
    });
    test("user registration12345", () async {
      bool expectedResult = false;
      User user = User(
          email: "pantsu@gmail.com",
          username: "pantsu",
          password: "brook123");
      bool actualResult = await usr.registerPost(user);
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
