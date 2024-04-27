import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_camp_sewa/layouts/layout_onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const OnboardLayout(),
            reverseDuration: const Duration(seconds: 2)),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-splash-screen.png"),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 250,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo-camp-sewa.png")),
                ),
              ),
            ),
          ),
          Text(
            "DEVELOP BY :",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 10, 25),
            child: Text(
              "TEAM PRODUKTIF4",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    ));
  }
}
