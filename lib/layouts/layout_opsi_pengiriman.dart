import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/button/alamat_opsi_pengiriman.dart';
import 'package:project_camp_sewa/components/button/opsi_pengiriman.dart';

class LayoutOpsiPengiriman extends StatefulWidget {
  const LayoutOpsiPengiriman({super.key});

  @override
  State<LayoutOpsiPengiriman> createState() => _LayoutOpsiPengirimanState();
}

class _LayoutOpsiPengirimanState extends State<LayoutOpsiPengiriman> {
  String selectedImageAntar = "assets/icons/selected-opsi-antar.png";
  String defaultImageAntar = "assets/icons/default-opsi-antar.png";
  String selectedImageAmbil = "assets/icons/selected-opsi-ambil.png";
  String defaultImageAmbil = "assets/icons/default-opsi-ambil.png";
  Color selectedBgColor = const Color(0xFF010935);
  Color defaultBgColor = Colors.white;
  Color selectedTextColor = Colors.white;
  Color defaultTextColor = Colors.black;
  String selectedOption = "antar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 28,
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 45,
                ),
                Text(
                  "Opsi Pengiriman",
                  style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ]),
            ),
            Container(
              color: Colors.black.withOpacity(0.25),
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 5),
              child: Text(
                "Pilih Jasa Pengiriman",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Text(
                  "Barang akan dikirim sesuai dengan alamat yang anda tentukan atau barang anda ambil di store penyewa",
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedOption = "antar";
                      });
                    },
                    child: ButtonOpsiPengiriman(
                      image: selectedOption == "antar"
                          ? selectedImageAntar
                          : defaultImageAntar,
                      bgColor: selectedOption == "antar"
                          ? selectedBgColor
                          : defaultBgColor,
                      borderColor: selectedOption == "antar"
                          ? selectedBgColor
                          : defaultTextColor,
                      teksColor: selectedOption == "antar"
                          ? selectedTextColor
                          : defaultTextColor,
                      teksOpsi: "Antar Ke Alamatmu",
                      teksHarga: "Dari IDR.5.000,00",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedOption = "ambil";
                      });
                    },
                    child: ButtonOpsiPengiriman(
                      image: selectedOption == "ambil"
                          ? selectedImageAmbil
                          : defaultImageAmbil,
                      bgColor: selectedOption == "ambil"
                          ? selectedBgColor
                          : defaultBgColor,
                      borderColor: selectedOption == "ambil"
                          ? selectedBgColor
                          : defaultTextColor,
                      teksColor: selectedOption == "ambil"
                          ? selectedTextColor
                          : defaultTextColor,
                      teksOpsi: "Ambil Ditempat",
                      teksHarga: "Dari IDR.0,00",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            AlamatOpsiPengiriman(
              opsi: "Alamat Pengiriman",
              alamat:
                  "Perumahan Mastrip, Blok F50, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur, Indonesia",
              keteranganKirim:
                  "Barang akan dikirim sesuai dengan tanggal yang ditentukan",
              opacity: selectedOption == "antar" ? 1 : 0.5,
              edit: selectedOption == "antar" ? true : false,
              checklist: selectedOption == "antar" ? true : false,
            ),
            AlamatOpsiPengiriman(
              opsi: "Alamat Store",
              alamat:
                  "Rumah Outdoor  Jl. Sumatra XIII No.20, Tegal Boto Lor, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur, Indonesia",
              keteranganKirim:
                  "Barang akan dikirim sesuai dengan tanggal yang ditentukan",
              opacity: selectedOption == "ambil" ? 1 : 0.5,
              edit: false,
              checklist: selectedOption == "ambil" ? true : false,
            ),
            Container(
              height: 1.2,
              color: Colors.black.withOpacity(0.25),
            ),
            const Spacer(),
            Container(
              height: 2,
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: InkWell(
                onTap: () {
                  //button konfirmasi
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF010935),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Konfirmasi",
                        style: GoogleFonts.poppins(
                            fontSize: 17,
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
      )),
    );
  }
}
