import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/http/httpuser.dart';
import 'package:my_app/model/user.dart';
import 'package:my_app/response/user_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpConnectUserProfile {
  final baseurl = 'http://$ip1:3001/api/users/';
  // final baseurl = 'http://$ip2:3001/api/users/';

  Future<User> getUserProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");

    String tok = 'Bearer $mytoken';

    final response = await http.get(Uri.parse(baseurl + "profile/"), headers: {
      'Authorization': tok,
    });
    if (response.statusCode == 200) {
      var result = ResponseUserProfile.fromJson(jsonDecode(response.body));

      return result.data[0];
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> updateUserProfile(User updateduser) async {
    bool result = false;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? mytoken = sharedPreferences.getString("token");

    Map<String, dynamic> user = {
      'username': updateduser.username,
      'email': updateduser.email,
    };
    String tok = 'Bearer $mytoken';

    try {
      final response = await http
          .post(Uri.parse(baseurl + 'updateprofile/'), body: user, headers: {
        'Authorization': tok,
      });
      if (response.statusCode == 200) {
        result = true;
        // MotionToast.success(description: Text("User updated successfully"));
        Fluttertoast.showToast(msg: "User updated successfully");
      }
    } catch (err) {
      log('$err');
    }
    return result;
  }
}
