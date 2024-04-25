import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_camp_sewa/layouts/layout_dashboard.dart';
import 'package:project_camp_sewa/layouts/layout_onboarding.dart';
import 'package:project_camp_sewa/screens/get_started.dart';
import 'package:project_camp_sewa/screens/screen_dashboard.dart';
import 'package:project_camp_sewa/screens/screen_login.dart';
import 'package:project_camp_sewa/screens/screen_register.dart';
import 'package:project_camp_sewa/screens/splash_screen.dart';

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
        // routes: {
        //   '/dashboard': (context) => const ScreenDashboard(),
        // },
        debugShowCheckedModeBanner: false,
        title: "KampSewa",
        // home: const ScreenDashboard(),
        home: OnboardLayout()
        );
  }
}
