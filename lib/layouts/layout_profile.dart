import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutProfile extends StatefulWidget {
  const LayoutProfile({super.key});

  @override
  State<LayoutProfile> createState() => _LayoutProfileState();
}

class _LayoutProfileState extends State<LayoutProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "Profile",
              style: GoogleFonts.poppins(
                  fontSize: 24.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            //photo profile
            //nama, email, noTelepone
            //button
            Container(  //garis pembatas
              color: Colors.black.withOpacity(0.25),
              height: 2,
            ),
            Row(    //menu pesanan saya
              children: [
                //icon, teks menu, icon >
              ],
            )
          ],
        ),
      )),
    );
  }
}
