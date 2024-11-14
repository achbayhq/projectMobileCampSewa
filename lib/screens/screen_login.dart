import 'package:flutter/material.dart';
import 'package:project_camp_sewa/layouts/layout_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutLogin(),
    );
  }
}
