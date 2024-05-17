import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_camp_sewa/components/card/rekomendasi_cari_card.dart';

class LayoutSearchScreen extends StatefulWidget {
  const LayoutSearchScreen({super.key});

  @override
  State<LayoutSearchScreen> createState() => _LayoutSearchScreenState();
}

class _LayoutSearchScreenState extends State<LayoutSearchScreen> {
  TextEditingController searchController = TextEditingController();
  List riwayatCari = [
    "Tenda",
    "Kompor Portabel",
    "Tas",
    "Jaket",
    "Sepatu",
    "Kacamata",
    "Sleeping Bag",
  ];
  List rekomendasiPencarian = [];
  bool showAllSearchHistory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                    onPressed: () {
                      navigator?.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded,
                        size: 35, color: Colors.black)),
              ),
              Text(
                "KampSewa.",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(MdiIcons.bellBadge,
                        size: 27, color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Temukan Peralatan.",
              style: GoogleFonts.poppins(
                  fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Cari peralatan untuk bertualang yang anda butuhkan dan anda inginkan.",
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 55,
              width: 385,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      MdiIcons.magnify,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Cari Peralatan...",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(MdiIcons.windowClose),
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                          )),
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Riwayat Pencarian",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (showAllSearchHistory)
                      ? riwayatCari.length
                      : (riwayatCari.length > 4)
                          ? 4
                          : riwayatCari.length,
                  itemBuilder: (context, index) => previousSearchsItem(index)),
            ),
            if (riwayatCari.length > 4 && !showAllSearchHistory)
              InkWell(
                onTap: () {
                  setState(() {
                    showAllSearchHistory = true;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        'Lihat Semua',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.6)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            if (showAllSearchHistory)
              InkWell(
                onTap: () {
                  setState(() {
                    riwayatCari.clear();
                    showAllSearchHistory = false;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        'Hapus semua riwayat',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red.shade800.withOpacity(0.8)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Rekomendasi Pencarian",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 500,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.740,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const RekomendasiCariCard();
                    }),
              ),
            )
          ])),
        ],
      )),
    );
  }

  previousSearchsItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            searchController.clear();
            searchController.text += riwayatCari[index];
          });
        },
        child: Row(
          children: [
            Text(riwayatCari[index],
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            const Spacer(),
            InkWell(
              onTap: () {
                riwayatCari.removeAt(index);
                setState(() {});
              },
              child: Icon(
                MdiIcons.windowClose,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
