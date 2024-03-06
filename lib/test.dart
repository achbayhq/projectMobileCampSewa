import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF32363F)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [],
            )
          ],
        ),
      ),
    )));
  }
}
