import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlamatCard extends StatefulWidget {
  final String? namaUser;
  final String? noTeleponUser;
  final String? alamatUser;
  final String? tipeAlamat;
  final Function()? editAlamat;
  const AlamatCard(
      {super.key,
      this.alamatUser,
      this.noTeleponUser,
      this.namaUser,
      this.tipeAlamat,
      required this.editAlamat});

  @override
  State<AlamatCard> createState() => _AlamatCardState();
}

class _AlamatCardState extends State<AlamatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.25), width: 1.5),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF494949).withOpacity(0.3),
                offset: const Offset(3.0, 3.0),
                blurRadius: 5.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color(0xFF010935)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: widget.editAlamat,
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              widget.namaUser!,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 3),
            child: Text(
              widget.noTeleponUser!,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              widget.alamatUser!,
              style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
            child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
