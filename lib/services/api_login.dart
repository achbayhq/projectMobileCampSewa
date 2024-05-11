import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:project_camp_sewa/constants/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:project_camp_sewa/screens/screen_dashboard.dart';


class ApiLogin extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authendpoints.login);

      Map body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['Success']) {
          var user = json['Data']['FullName'];
          var phone = json['Data']['PhoneNumber'];
          var logger = Logger();
          logger.e(user);
          logger.e(phone);
          emailController.clear();
          passwordController.clear();
          if (context.mounted) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenDashboard(),
                ));
          }
        } else {
          throw json['Error'] ?? "Unknown Error Occurred";
        }
      } else {
        throw "HTTP ${response.statusCode} Error Occurred";
      }
    } catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(
                e.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
