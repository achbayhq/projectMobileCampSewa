import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WisataCard extends StatefulWidget {
  const WisataCard({super.key});

  @override
  State<WisataCard> createState() => _WisataCardState();
}

class _WisataCardState extends State<WisataCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          //color: Colors.amber,
          image: const DecorationImage(image: AssetImage("assets/images/bg-onboard-wisata.jpeg"), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3.0,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Labuan Bajo",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Surga bawah laut, gugusan pulau, pantai berpasir putih, biota laut beragam",
                      style: GoogleFonts.poppins(
                          fontSize: 8, fontWeight: FontWeight.w600),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: Row(
                children: [
                  const Icon(Icons.location_pin, color: Colors.black, size: 15,),
                  Text(
                    "Papua Barat",
                    style: GoogleFonts.poppins(
                        fontSize: 9, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
