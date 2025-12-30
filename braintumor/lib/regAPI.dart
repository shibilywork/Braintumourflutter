import 'package:braintumor/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String baseurl = 'http://192.168.1.96:5000';
final Dio dio = Dio();

Future<String?> registerUser({
  required String name,
  required String phone,
  required String age,
  required String gender,
  required String email,
  required String password,
  required context,
}) async {
  try {
    final formData = {
      'name': name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'email': email,
      'username': email,
      'password': password,
      };

    final response = await dio.post('$baseurl/userregAPI', data: formData);


if (response.statusCode == 200 || response.statusCode == 201) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route)=>false);
  return "Registration successful";
} else {
  return response.data['error'] ?? "Registration failed";
}
} catch (e) {
 print(e);
}
}