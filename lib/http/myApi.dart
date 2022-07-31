import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:my_app/constants.dart';

class Api {
  final http.Client client;

  Api({required this.client});

  Future<String> registerUser(String username) async {
    try {
      final response = await client.post(
         Uri.parse('http://$ip1:3001/api/users/checkusername'),

          // Uri.parse('http://$ip2:3001/api/users/checkusername'),
          
          body: username);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return '${data.data['email']}';
      } else {
        return "something went wrong";
      }
    } catch (error) {
      return "an error occured";
    }
  }
}
