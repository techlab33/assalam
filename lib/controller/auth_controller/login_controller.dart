import 'dart:convert';
import 'dart:developer';

import 'package:assalam/screens/bottom_nav_bar_page/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  RxBool isLoading = false.obs;
  RxBool userLogin = true.obs;

  // Login
  Future<void> login() async {
    try {
      // loader
      isLoading.value = true;

      var headers = {'Content-Type': 'application/json'};
      // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var url = Uri.parse('https://assalam.icam.com.bd/api/login');
      // body
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {

        final json = jsonDecode(response.body);
        log(response.body);

        // Show Success Message
        Fluttertoast.showToast(
            msg: jsonDecode(response.body)['message'] ,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );

        // Navigate Login Screen
        Get.offAll(const BottomNaveBarPage());

        // Clear Text Field
        emailController.clear();
        passwordController.clear();

        // loader
        isLoading.value = false;

      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occurred';
      }
    } catch (e) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(e.toString()),
            ],
          );
        },
      );
      // loader
      isLoading.value = false;
    }
  }

  // Check user is Login
  // Future<bool> isLogin() async{
  //   final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //   if(sharedPref.containsKey(AppConstraints.userId) && sharedPref.getString(AppConstraints.userId)!.isNotEmpty){
  //     userLogin.value = true;
  //     return Future.value(true);
  //   }else{
  //     userLogin.value = false;
  //     return Future.value(false);
  //   }
  //
  // }
//

// int userId = json["user"]["id"];
// String userName = json["user"]["name"];
// String userEmail = json["user"]["email"];
//
// print('User Id = $userId');
// print('User Name = $userName');
// print('User email = $userEmail');


// final SharedPreferences sharedPref = await SharedPreferences.getInstance();
// Save Id
// sharedPref.setString(AppConstraints.userId, userId.toString());
// // save name
// sharedPref.setString(AppConstraints.userName, userName);
// // save phone
// sharedPref.setString(AppConstraints.userPhone, userPhone);
// // save email
// sharedPref.setString(AppConstraints.userEmail, userEmail);
// // save present address
// // sharedPref.setString(AppConstraints.userPresentAddress, userPresentAddress);
// // save permanent address
// // sharedPref.setString(AppConstraints.userPermanentAddress, userPermanentAddress);
// // save designation
// sharedPref.setString(AppConstraints.userDesignation, userDesignation);

}
