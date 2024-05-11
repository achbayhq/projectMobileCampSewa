import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutOpsiPengiriman extends StatefulWidget {
  const LayoutOpsiPengiriman({super.key});

  @override
  State<LayoutOpsiPengiriman> createState() => _LayoutOpsiPengirimanState();
}

class _LayoutOpsiPengirimanState extends State<LayoutOpsiPengiriman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                          size: 28,
                        )),
                    Text(
                          "Opsi Pengiriman",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                    const SizedBox(),
                  ]),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
