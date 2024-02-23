import 'package:flutter/material.dart';

class LayoutLogin extends StatefulWidget {
  const LayoutLogin({super.key});

  @override
  State<LayoutLogin> createState() => _LayoutLoginState();
}

class _LayoutLoginState extends State<LayoutLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
