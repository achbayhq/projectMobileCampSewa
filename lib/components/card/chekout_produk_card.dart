import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutProdukCard extends StatefulWidget {
  final String? image;
  final String? namaToko;
  final String? namaProduk;
  final String variasiWarna;
  final String variasiUkuran;
  final String? hargaProduk;
  final String? qtyProduk;
  const CheckoutProdukCard(
      {super.key,
      this.image,
      this.namaToko,
      this.namaProduk,
      this.variasiWarna = "",
      this.variasiUkuran = "",
      this.hargaProduk,
      this.qtyProduk});

  @override
  State<CheckoutProdukCard> createState() => _CheckoutProdukCardState();
}

class _CheckoutProdukCardState extends State<CheckoutProdukCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: Container(
              color: const Color(0xFF010935),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 5,),
                        child: Image.asset(
                          "assets/icons/icon-store.png",
                          scale: 2,
                        ),
                      ),
                      Text(
                        widget.namaToko!,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage(widget.image!)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF494949).withOpacity(0.2),
                            offset: const Offset(0, 0),
                            blurRadius: 3)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              widget.namaProduk!,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            widget.variasiUkuran != "" &&
                                    widget.variasiWarna != ""
                                ? "${widget.variasiUkuran}/${widget.variasiWarna}"
                                : widget.variasiUkuran != ""
                                    ? widget.variasiUkuran
                                    : widget.variasiWarna,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //Rating
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "IDR. ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      widget.hargaProduk!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      ",00",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "x",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      widget.qtyProduk!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
