import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_camp_sewa/components/card/chekout_produk_card.dart';
import 'package:project_camp_sewa/layouts/layout_metode_pembayaran.dart';
import 'package:project_camp_sewa/layouts/layout_opsi_pengiriman.dart';
import 'package:project_camp_sewa/layouts/layout_pembayaran.dart';

class LayoutCheckout extends StatefulWidget {
  const LayoutCheckout({super.key});

  @override
  State<LayoutCheckout> createState() => _LayoutCheckoutState();
}

class _LayoutCheckoutState extends State<LayoutCheckout> {
  String metodeBayar = "Bayar Ditempat";
  String opsiPengiriman =
      "Ambil Ditempat"; //untuk alamat pengirimannya nanti isi alamat store langsung dari API
  String alamatPengiriman =
      "Rumah Outdoor  Jl. Sumatra XIII No.20, Tegal Boto Lor, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur, Indonesia";
  String? jenisBank;
  DateTime? tanggalAwal;
  DateTime? tanggalAkhir;
  DateTimeRange durasiSewa =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  String? formatedTanggalAwal;
  String? formatedTanggalAkhir;
  TextEditingController pesanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 10,
                ),
                Text(
                  "Checkout",
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
            Expanded(
              child: ListView(
                children: [
                  ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const CheckoutProdukCard(
                            image: "assets/images/produk1.jpeg",
                            namaToko: "Abay Store",
                            namaProduk: "Tenda camp",
                            variasiWarna: "Biru",
                            hargaProduk: "25.000",
                            qtyProduk: "2",
                          )),
                  const SizedBox(
                    height: 3,
                  ),
                  InkWell(
                    onTap: () async {
                      final tanggalSewa = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 90)));

                      if (tanggalSewa != null) {
                        setState(() {
                          durasiSewa = tanggalSewa;
                          tanggalAwal = tanggalSewa.start;
                          tanggalAkhir = tanggalSewa.end;
                          formatedTanggalAwal =
                              DateFormat('dd-MM-yyyy').format(tanggalAwal!);
                          formatedTanggalAkhir =
                              DateFormat('dd-MM-yyyy').format(tanggalAkhir!);
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.black.withOpacity(0.3))),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 2),
                              child: Text(
                                "Tentukan Tanggal Sewa",
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 6, top: 5, bottom: 5),
                                  child: Image.asset(
                                    "assets/icons/calendar-icon.png",
                                    scale: 1.5,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Tanggal Mulai : ",
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          tanggalAwal != null
                                              ? formatedTanggalAwal!
                                              : "-", //teks tanggal awal
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Tanggal Akhir : ",
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          tanggalAkhir != null
                                              ? formatedTanggalAkhir!
                                              : "-", //teks tanggal akhir
                                          style: GoogleFonts.poppins(
                                              fontSize: 10.5,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.black,
                                  size: 25,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final pilihanPengiriman =
                          await Get.to(const LayoutOpsiPengiriman());
                      setState(() {
                        if (pilihanPengiriman != null) {
                          opsiPengiriman = pilihanPengiriman['selectedOption'];
                          alamatPengiriman = pilihanPengiriman['alamat'];
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: Colors.black.withOpacity(0.25))),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3, bottom: 4),
                              child: Text(
                                "Opsi Pengiriman",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  //opsi pengiriman
                                  opsiPengiriman,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Image.asset(
                                  "assets/icons/tiket-icon.png",
                                  scale: 2.1,
                                ),
                                Text(
                                  "IDR. 0,00",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.black,
                                  size: 25,
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.25,
                              child: Text(
                                //alamat
                                alamatPengiriman,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/box-kirim.png",
                                  scale: 2,
                                ),
                                Text(
                                  "Ambil barang sesuai dengan tanggal yang ditentukan",
                                  style: GoogleFonts.poppins(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFCD1B1B)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.black.withOpacity(0.25),
                                width: 1.2)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Pesan : ",
                              style: GoogleFonts.poppins(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextField(
                                controller: pesanController,
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(
                                    fontSize: 11, fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText:
                                      "Silahkan tinggalkan pesan tambahan jika ada",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.black.withOpacity(0.25),
                                width: 0.5)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Total Produk : ",
                            style: GoogleFonts.poppins(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          Text(
                            "3", //total produk
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(
                            " Produk",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final pilihanPembayaran =
                          await Get.to(const LayoutMetodePembayaran());
                      setState(() {
                        if (pilihanPembayaran != null) {
                          metodeBayar = pilihanPembayaran["metodeBayar"];
                          jenisBank = pilihanPembayaran["jenisBank"];
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: Colors.black.withOpacity(0.25),
                                  width: 1.2)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 2, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/coin-icon.png",
                              scale: 2,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Metode Pembayaran",
                              style: GoogleFonts.poppins(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            Text(
                              jenisBank != null
                                  ? "$metodeBayar - ${jenisBank!}"
                                  : metodeBayar, //metode pembayaran
                              style: GoogleFonts.poppins(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const Icon(
                              Icons.navigate_next_rounded,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.calendarText,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Rincian Pembayaran",
                          style: GoogleFonts.poppins(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 6),
                    child: Row(
                      children: [
                        Text(
                          "Durasi Sewa",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          "${durasiSewa.duration.inDays}", //durasi sewa
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          " Hari",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 6),
                    child: Row(
                      children: [
                        Text(
                          "Sub Total Produk",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          "IDR. ",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "120.000", //sub total harga
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          ",00",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 6),
                    child: Row(
                      children: [
                        Text(
                          "Biaya Layanan",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          "IDR. ",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "1.000", //sub total harga
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          ",00",
                          style: GoogleFonts.poppins(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 6),
                    child: Row(
                      children: [
                        Text(
                          "Total Pembayaran",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          "IDR. ",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          "121.000", //total pembayaran
                          style: GoogleFonts.poppins(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          ",00",
                          style: GoogleFonts.poppins(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.25),
                    height: 2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: InkWell(
                onTap: () {
                  //button checkout
                  Get.to(const LayoutPembayaran());
                },
                child: Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF010935)),
                  child: Center(
                    child: Text(
                      "Lanjut Pembayaran",
                      style: GoogleFonts.poppins(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
