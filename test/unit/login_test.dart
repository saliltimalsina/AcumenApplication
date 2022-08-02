import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/model/user.dart';

void main() {
  group("user api test", () {
    late final HttpConnectUser usr;
    setUp(() {
      usr = HttpConnectUser();
    });
    test("user login", () async {
      bool expectedResult = true;
      bool actualResult =
          await HttpConnectUser().loginPosts("saliltimal", "qwerty");
      expect(expectedResult, actualResult);
    });
  });
  // tearDown((){
  //   HttpConnectUser= null;
  // });
}
