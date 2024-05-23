import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_camp_sewa/components/card/berita_dash_card.dart';
import 'package:project_camp_sewa/components/button/icon_kategori.dart';
import 'package:project_camp_sewa/components/card/produk_terlaris_card.dart';
import 'package:project_camp_sewa/components/card/wisata_dash_card.dart';
import 'package:project_camp_sewa/layouts/layout_keranjang.dart';
import 'package:project_camp_sewa/layouts/layout_search_screen.dart';
import 'package:project_camp_sewa/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutDashboard extends StatefulWidget {
  const LayoutDashboard({super.key});

  @override
  State<LayoutDashboard> createState() => _LayoutDashboardState();
}

class _LayoutDashboardState extends State<LayoutDashboard> {
  List kategoriIcon = ["Tenda", "Pakaian", "Tas & Sepatu", "Perlengkapan"];

  List imageList = [
    {"id": 1, "image_path": 'assets/images/bg_login.jpg'},
    {"id": 2, "image_path": 'assets/images/bg-onboard-berita.jpeg'},
    {"id": 3, "image_path": 'assets/images/bg-onboard-wisata.jpeg'},
    {"id": 4, "image_path": 'assets/images/bg-onboard-berita.jpeg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 70, bottom: 25),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/dash-header-img.jpeg"),
                    fit: BoxFit.fill,
                    opacity: 0.7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      //photo profile
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/pp.jpg"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          //nama user
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Achmad Bayhaqi",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Icon(
                                //icon lokasi dibawah nama
                                Icons.location_pin,
                                color: Colors.black,
                                size: 16,
                              ),
                              Text(
                                //lokasi user
                                "Sumbersari, Jember",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        //fungsi klik notification
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('token');
                        await prefs.remove('userId');
                        Get.to(const LoginScreen());
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.notifications_rounded,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const LayoutKeranjang());
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        // field cari peralatan
                        child: InkWell(
                          onTap: () {
                            Get.to(const LayoutSearchScreen());
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.search_rounded,
                                  color: Colors.black.withOpacity(0.45),
                                  size: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Cari Peralatan...",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.45)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(children: [
                    InkWell(
                      onTap: () {
                        //tap iklannya maka akan menampilkan barang/toko pengiklan
                      },
                      child: CarouselSlider(
                        //iklannya disini
                        items: imageList.map((item) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Atur radius lengkungan iklannya
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
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? Colors.amber
                                      : Colors.green),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kategori",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                        width: 2,
                      ),
                      itemCount: kategoriIcon.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Terlaris",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBBBBBB),
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 0, 0),
                  child: SizedBox(
                    height: 250,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          const ProdukTerlarisDashboard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 12,
                      ),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Wisata",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBBBBBB),
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: SizedBox(
                    height: 185,
                    child: ListView.separated(
                      itemBuilder: (context, index) => const WisataCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Berita",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBBBBBB),
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  child: SizedBox(
                    height: 110 * 8, //110 dikali item count
                    child: ListView.separated(
                      itemBuilder: (context, index) => const BeritaCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //scrollDirection: Axis.vertical
                    ),
                  ),
                ),
              ], //Batas Scroll Isi kontennya
            ),
          ),
        ],
      ),
    );
  }
}
