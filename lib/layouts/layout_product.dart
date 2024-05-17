import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/button/icon_kategori.dart';
import 'package:project_camp_sewa/components/card/produk_terlaris_card.dart';
import 'package:project_camp_sewa/components/input/search_bar.dart';
import 'package:project_camp_sewa/layouts/layout_search_screen.dart';

class LayoutProduct extends StatefulWidget {
  const LayoutProduct({super.key});

  @override
  State<LayoutProduct> createState() => _LayoutProductState();
}

class _LayoutProductState extends State<LayoutProduct> {
  List kategoriIcon = [
    "Rekomendasi",
    "Terkait",
    "Terbaru",
    "Perlengkapan",
    "Tas & Sepatu",
    "Tenda",
    "Pakaian"
  ];

  void getSystemBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFE8E9EC),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  @override
  void initState() {
    getSystemBarTheme();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                          size: 28,
                        )),
                  ),
                  Text(
                    "Produk",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.black,
                          size: 27,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: MySearchBar(
                aksi: () {
                  Get.to(const LayoutSearchScreen());
                },
                teks: "Tenda, Nesting, Meja Lipat, Kursi Lipat",
                backgroundColor: Colors.white,
                border: Border.all(color: Colors.black, width: 1.2),
                fontColor: Colors.black.withOpacity(0.45),
                fontSize: 13,
                iconColor: Colors.black,
                iconSize: 30,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, bottom: 15),
                    child: Container(
                      height: 38,
                      width: 42,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/icons/filter-icon.png"),
                              scale: 1.7)),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => KategoriIcon(
                          title: kategoriIcon[index],
                          backgroundColor: Colors.black,
                          teksColor: Colors.white,
                          aksi: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Kategori ${kategoriIcon[index]} diklik')),
                            );
                          },
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 3,
                        ),
                        itemCount: kategoriIcon.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.62,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.740,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProdukTerlarisDashboard();
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
