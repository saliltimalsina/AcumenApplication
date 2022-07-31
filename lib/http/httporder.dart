import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/model/order.dart';
import 'package:my_app/response/placeorder_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpConnectOrder {
  final baseurl = 'http://$ip1:3001/api/orders/';
  // final baseurl = 'http://$ip2:3001/api/orders/';
 

  Future<bool> placeOrder(Order neworder) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");
    bool result = false;
    Map<String, dynamic> order = {
      'orderItems': neworder.orderItems,
      'orderAmount': neworder.orderAmount,
    };
    String tok = 'Bearer $mytoken';

    try {
      final response = await http.post(Uri.parse(baseurl + 'submitorder/'),
          body: json.encode(order),
          headers: {
            'Content-Type': 'Application/json',
            'Authorization': tok,
          });
      if (response.statusCode == 200) {
        result = true;
        // Fluttertoast.showToast(msg: "Order placed successfully");
        return result;
      }
    } catch (err) {
      log('$err');
    }
    return result;
  }

  Future <List<Order>> getOrders() async{
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");
    String tok = 'Bearer $mytoken';

    final response =
        await http.get(Uri.parse(baseurl + "getuserorders/"), headers: {
      'Authorization': tok,
    });
    if (response.statusCode == 200) {
      // print(response.body);
      var a = ResponseGetOrder.fromJson(jsonDecode(response.body));
      return a.data;
    } else {
      throw Exception('Failed to load orders');
    }

  }


  
}
