import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutAlamat extends StatefulWidget {
  const LayoutAlamat({super.key});

  @override
  State<LayoutAlamat> createState() => _LayoutAlamatState();
}

class _LayoutAlamatState extends State<LayoutAlamat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 28,
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "Alamat Saya",
                  style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ]),
            ),
            Container(
              color: Colors.black.withOpacity(0.25),
              height: 2,
            ),
          ],
        ),
      )),
    );
  }
}
