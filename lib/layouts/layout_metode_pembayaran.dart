import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/button/opsi_pembayaran.dart';

class LayoutMetodePembayaran extends StatefulWidget {
  const LayoutMetodePembayaran({super.key});

  @override
  State<LayoutMetodePembayaran> createState() => _LayoutMetodePembayaranState();
}

class _LayoutMetodePembayaranState extends State<LayoutMetodePembayaran> {
  String selectedIcon = "assets/icons/selected-opsi-bayar.png";
  String defaultIcon = "assets/icons/default-opsi-bayar.png";
  Color selectedBgColor = const Color(0xFF010935);
  Color defaultBgColor = Colors.white;
  Color selectedTextColor = Colors.white;
  Color defaultTextColor = Colors.black;
  String selectedOption = "transfer";

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
                  width: MediaQuery.of(context).size.width / 4 - 55,
                ),
                Text(
                  "Metode Pembayaran",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
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
                "Pilih Metode Pembayaran",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  "Harap membaca syarat & ketentuan saat memilih metode pembayaran",
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black.withOpacity(0.25),
              height: 1.5,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedOption = "transfer";
                });
              },
              child: OpsiPembayaran(
                bgColor: selectedOption == "transfer"
                    ? selectedBgColor
                    : defaultBgColor,
                icon: selectedOption == "transfer" ? selectedIcon : defaultIcon,
                teksColor: selectedOption == "transfer"
                    ? selectedTextColor
                    : defaultTextColor,
                checklist: selectedOption == "transfer" ? true : false,
                opsiBayar: "Transfer",
                keterangan:
                    "Pembayaran ini melalui cara transfer dan barang siap untuk dikirim atau diambil di store",
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedOption = "COD";
                });
              },
              child: OpsiPembayaran(
                bgColor:
                    selectedOption == "COD" ? selectedBgColor : defaultBgColor,
                icon: selectedOption == "COD" ? selectedIcon : defaultIcon,
                teksColor: selectedOption == "COD"
                    ? selectedTextColor
                    : defaultTextColor,
                checklist: selectedOption == "COD" ? true : false,
                opsiBayar: "COD",
                keterangan:
                    "Pembayaran ini akan dilakukan saat pengambilan barang",
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.25),
              height: 1.5,
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
