import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutSearchScreen extends StatefulWidget {
  const LayoutSearchScreen({super.key});

  @override
  State<LayoutSearchScreen> createState() => _LayoutSearchScreenState();
}

class _LayoutSearchScreenState extends State<LayoutSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              "KampSewa.",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        )
      ],
    ));
  }
}
