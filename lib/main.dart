import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_camp_sewa/layouts/layout_onboarding.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF32363F),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Marketplace KampSewa Indonesia",
        home: OnboardLayout());
  }
}
