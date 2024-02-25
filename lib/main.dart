import 'package:flutter/material.dart';
import 'package:project_camp_sewa/screens/get_started.dart';
import 'package:project_camp_sewa/screens/screen_dashboard.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dashboard': (context) => const ScreenDashboard(),
      },
      debugShowCheckedModeBanner: false,
      title: "KampSewa",
      home: const LoginRegister(),
    );
  }
}
