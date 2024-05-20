import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlamatCard extends StatefulWidget {
  final String? namaUser;
  final String? noTeleponUser;
  final String? alamatUser;
  final String? tipeAlamat;
  const AlamatCard(
      {super.key,
      this.alamatUser,
      this.noTeleponUser,
      this.namaUser,
      this.tipeAlamat});

  @override
  State<AlamatCard> createState() => _AlamatCardState();
}

class _AlamatCardState extends State<AlamatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color(0xFF010935)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          //edit alamat
                        },
                        child: Text(
                          "Edit Alamat",
                          style: GoogleFonts.poppins(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text(
              widget.namaUser!,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Text(
              widget.noTeleponUser!,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              widget.alamatUser!,
              style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Row(
              children: [
                widget.tipeAlamat == "rumah"
                    ? Image.asset(
                        "assets/icons/icon-alamat-home.png",
                        scale: 2,
                      )
                    : Image.asset(
                        "assets/icons/alamat-kantor.png",
                        scale: 2,
                      ),
                widget.tipeAlamat == "rumah"
                    ? Text(
                        "Rumah",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    : Text(
                        "Kantor",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
