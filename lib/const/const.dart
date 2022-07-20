import 'package:my_app/http/httpuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String UID=HttpConnectUser.token; //uid from authentication


Future<String?> getToken() async{
  final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");
    return mytoken;
}
