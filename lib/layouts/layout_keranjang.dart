import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/card/group_produk_keranjang.dart';
import 'package:project_camp_sewa/components/card/keranjang_card.dart';
import 'package:project_camp_sewa/layouts/layout_checkout.dart';

class LayoutKeranjang extends StatefulWidget {
  const LayoutKeranjang({super.key});

  @override
  State<LayoutKeranjang> createState() => _LayoutKeranjangState();
}

class _LayoutKeranjangState extends State<LayoutKeranjang> {
  List keranjang = [];

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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
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
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          "Keranjang",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              height: 2.3,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            const GroupProdukKeranjang(
                          namaToko: "BayHq Shop",
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemCount: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              height: 3,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 18, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          "Total Item",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Text(
                          "10", //total item
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          " Item",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Text(
                          "IDR. ",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "200.000", //total harga
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ",00/hari",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LayoutCheckout());
                    },
                    child: Container(
                      height: 55,
                      width: 355,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF010935)),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: GoogleFonts.poppins(
                              fontSize: 18.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
