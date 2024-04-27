import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:project_camp_sewa/constants/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:project_camp_sewa/screens/screen_login.dart';

class ApiRegistrasi extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registrasi() async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authendpoints.register);
      Map body = {
        'fullName': namaController.text,
        'email': emailController.text.trim(),
        'phoneNumber': phoneNumberController.text,
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['Success']) {
          var user = json['Data']['FullName'];
          var logger = Logger();
          logger.e(user);
          namaController.clear();
          emailController.clear();
          phoneNumberController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          Get.to(const LoginScreen());
        } else {
          throw jsonDecode(response.body)['Error'] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)['Error'] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return Stack(
              children: [
                SimpleDialog(
                  title: const Text("Error"),
                  contentPadding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      e.toString(),
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            );
          });
    }
  }
}
