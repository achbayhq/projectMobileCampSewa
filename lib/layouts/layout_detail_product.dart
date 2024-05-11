import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/card/item_variant.dart';

class LayoutDetailProduct extends StatefulWidget {
  const LayoutDetailProduct({super.key});

  @override
  State<LayoutDetailProduct> createState() => _LayoutDetailProductState();
}

class _LayoutDetailProductState extends State<LayoutDetailProduct> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/produk1.jpeg'},
    {"id": 2, "image_path": 'assets/images/produk2.jpeg'},
    {"id": 3, "image_path": 'assets/images/produk1.jpeg'},
    {"id": 4, "image_path": 'assets/images/produk2.jpeg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(children: [
              CarouselSlider(
                items: imageList.map((item) {
                  return ClipRRect(
                    child: Image.asset(
                      item['image_path'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  aspectRatio: 1,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 18.5 : 8.5,
                        height: 9,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? const Color(0xFF000000)
                                : const Color(0xFFBBBBBB)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      //button back
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.75),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 32,
                      ),
                    ),
                  )),
            ]),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 45,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                border: Border(
                    top: BorderSide(
                        color: Colors.black.withOpacity(0.25), width: 2.5),
                    left: BorderSide(
                        color: Colors.black.withOpacity(0.25), width: 2),
                    right: BorderSide(
                        color: Colors.black.withOpacity(0.25), width: 2)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, top: 15, bottom: 10),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFDD7801),
                                size: 25,
                              ),
                              Text(
                                "4.5", //rating
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFDD7801)),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 38,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE6E6E6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "123", //ulasan
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        " Ulasan",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "The Nort Face 4", //Nama Produk
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Kapasitas 4 orang, Double Layer", //Deskripsi singkat Produk
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Tenda kubah geodesik untuk 4 orang di North Face merupakan bukti filosofi merek "Do More With Less". Tenda ini menggabungkan struktur geodesik yang dikembangkan oleh Dr. Buckminster Fuller dan struktur tegangan unik. ', //Deskripsi Produk
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Ukuran",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const ItemVariant(
                                      item: "4",
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 5,
                                    ),
                                itemCount: 5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 3),
                            child: Text(
                              "Warna",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const ItemVariant(
                                      item: "Putih",
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 5,
                                    ),
                                itemCount: 3),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Syarat dan Ketentuan",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            "1. Menjaminkan Kartu identitas saat pengambilan (KTP, KTM, Kartu Pelajar). \n2. Kerusakan, kehilangan dan keterlambatan akan dikenakan denda. \n3. Keterlambatan maksimal 2 jam setelah masa sewa habis.",
                            style: GoogleFonts.poppins(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Colors.black.withOpacity(0.25),
                                width: 2))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "IDR. ",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          Text(
                            "30.000", //harga produk
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          Text(
                            ",00/hari",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xFF010935)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/add-cart.png",
                                    scale: 2,
                                  ),
                                  Text(
                                    "Keranjang",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
