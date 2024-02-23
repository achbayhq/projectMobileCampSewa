import 'package:flutter/material.dart';
import 'package:project_camp_sewa/screens/get_started.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KampSewa",
      home: LoginRegister(),
    );
  }
}
