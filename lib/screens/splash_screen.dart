import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_camp_sewa/screens/screen_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(const Duration(seconds: 5), () {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => const LoginRegister()));
  //   });
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      duration: 2000,
      splashIconSize: 150,
      splash: "assets/images/logo-camp-sewa.png",
      backgroundColor: const Color(0xFF47B49A),
    ),
    );
  }
}
