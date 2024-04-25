import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KategoriIcon extends StatelessWidget {
  final Function()? aksi;
  final String title;

  const KategoriIcon(
      {super.key,
      this.aksi,
      required this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            if (aksi != null) {
              aksi!();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(title,
                    style: GoogleFonts.poppins(
                    fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),)
                )),
          ),
        ),
      ],
    );
  }
}
