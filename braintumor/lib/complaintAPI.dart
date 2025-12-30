import 'package:braintumor/homepage.dart';
import 'package:braintumor/loginAPI.dart';
import 'package:braintumor/regAPI.dart';
import 'package:flutter/material.dart';



// Future<void> ComplaintAPI({
//   required String Complaint,

//   context
// }) async {
//   try {
//     final response = await dio.post(
//       '$baseurl/ViewComplaint/$lid',
//       data: {
//         'complaint':Complaint
//       },
//     );

//     print(response.data);

//     if (response.statusCode == 200 || response.data ==201) {
      
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('complaint sent successfully')));
       
      
//     }

//     print(response.data);
//   } 
//  catch (e) {
//   print('Login error: $e');
// }}

Future<bool> sendComplaint({
  required String complaint,
}) async {
  try {
    final response = await dio.post(
      '$baseurl/ViewComplaint/$lid',
      data: {'complaint': complaint},
    );

    return response.statusCode == 201;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<List<dynamic>> fetchComplaints() async {
  try {
    final response = await dio.get('$baseurl/ViewComplaint/$lid');
    return response.data ?? [];
  } catch (e) {
    print(e);
    return [];
  }
}