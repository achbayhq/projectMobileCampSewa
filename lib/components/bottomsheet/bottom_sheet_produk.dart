import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_camp_sewa/components/card/item_variant.dart';

class BottomSheetProduk extends StatefulWidget {
  final String? image;
  final String? namaProduk;
  final String? harga;
  final List? variasiWarna;
  final List? variasiUkuran;
  const BottomSheetProduk(
      {super.key,
      this.image,
      this.namaProduk,
      this.harga,
      this.variasiWarna,
      this.variasiUkuran});

  @override
  State<BottomSheetProduk> createState() => _BottomSheetProdukState();
}

class _BottomSheetProdukState extends State<BottomSheetProduk> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(widget.image!))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.namaProduk!,
                            style: GoogleFonts.poppins(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              Text(
                                "IDR. ",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                widget.harga!,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                ",00/hari",
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
                const SizedBox(height: 5,),
                widget.variasiWarna != null
                    ? Text(
                        "Warna",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    : const SizedBox(),
                widget.variasiWarna != null
                    ? SizedBox(
                        height: 30,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ItemVariant(
                                  item: widget.variasiWarna![index],
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: widget.variasiWarna!.length),
                      )
                    : const SizedBox(),
                    const SizedBox(height: 5,),
                widget.variasiUkuran != null
                    ? Text(
                        "Ukuran",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    : const SizedBox(),
                widget.variasiUkuran != null
                    ? SizedBox(
                        height: 30,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ItemVariant(
                                  item: widget.variasiUkuran![index],
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: widget.variasiUkuran!.length),
                      )
                    : const SizedBox(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jumlah",
                      style: GoogleFonts.poppins(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.5, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                //tambah qty produk
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "10",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            InkWell(
                              onTap: () {
                                //kurangi qty produk
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Icon(
                                  MdiIcons.minus,
                                  size: 21,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 15),
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    height: 1.2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //tambahkan ke keranjang
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF010935)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text(
                            "Tambahkan ke Keranjang",
                            style: GoogleFonts.poppins(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top : 10,
          right: 10,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                  size: 25,
                )))
      ],
    );
  }
}
