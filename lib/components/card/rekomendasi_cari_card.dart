import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RekomendasiCariCard extends StatefulWidget {
  const RekomendasiCariCard({super.key});

  @override
  State<RekomendasiCariCard> createState() => _RekomendasiCariCardState();
}

class _RekomendasiCariCardState extends State<RekomendasiCariCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 180,
        height: 235,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF494949).withOpacity(0.3),
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 5.0)
            ]),
        child: Column(
          children: [
            Container(
              width: 175,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/produk1.jpeg"))),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 37,
                        child: Text(
                          "Borneo 4 double layer kapasitas 4 orang",
                          style: GoogleFonts.poppins(
                              fontSize: 11, fontWeight: FontWeight.w600),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4.5",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
