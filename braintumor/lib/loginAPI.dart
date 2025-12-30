import 'package:braintumor/homepage.dart';
import 'package:braintumor/regAPI.dart';
import 'package:flutter/material.dart';

int? lid;

Future<void> loginUser({
  required String username,
  required String password,
  context
}) async {
  try {
    final response = await dio.post(
      '$baseurl/loginpageAPI',
      data: {
        'username': username,
        'password': password,
      },
    );

    print(response.data);

    if (response.statusCode == 200 || response.data ==201) {
      lid = response.data['login_id'];

      
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
       
      
    }

    print(response.data);
  } 
 catch (e) {
  print('Login error: $e');
}}
