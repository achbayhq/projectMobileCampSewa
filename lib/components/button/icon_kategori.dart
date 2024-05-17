import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriIcon extends StatelessWidget {
  final Function()? aksi;
  final String title;
  final Color? backgroundColor;
  final Color? teksColor;

  const KategoriIcon(
      {super.key, this.aksi, required this.title, this.backgroundColor, this.teksColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (aksi != null) {
              aksi!();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Center(
                      child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: teksColor),
                  )),
                )),
          ),
        ),
      ],
    );
  }
}
