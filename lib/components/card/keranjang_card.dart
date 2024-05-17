import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ItemKeranjangCard extends StatefulWidget {
  const ItemKeranjangCard({super.key});

  @override
  State<ItemKeranjangCard> createState() => _ItemKeranjangCardState();
}

class _ItemKeranjangCardState extends State<ItemKeranjangCard> {
  bool dipilih = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
            horizontal:
                BorderSide(color: Colors.black.withOpacity(0.3), width: 0.8)),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.orange,
            checkColor: Colors.white,
            value: dipilih,
            onChanged: (bool? value) {
              setState(() {
                dipilih = value!;
              });
            },
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 8, top: 12, bottom: 12),
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/produk2.jpeg"), //image Produk
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Nort Face 4 ", //Nama Produk
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Double Layers", //variasi ukuran
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " , ",
                          style: GoogleFonts.poppins(
                              fontSize: 8, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Hitam", //variasi warna
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          "IDR. ",
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "20.000", //harga produk
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ",00/hari",
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, bottom: 10, top: 5),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, width: 1.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2.5, vertical: 3),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    //tambah qty produk
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "10",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w700),
                                ),
                                InkWell(
                                  onTap: () {
                                    //kurangi qty produk
                                  },
                                  child: Icon(
                                    MdiIcons.minus,
                                    size: 21,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //hapus produk
            },
            child: Container(
              width: 30,
              decoration: const BoxDecoration(color: Color(0xFFCD1B1B)),
              child: Center(
                  child: Image.asset(
                "assets/icons/trash.png",
                scale: 2.1,
              )),
            ),
          )
        ],
      ),
    );
  }
}
