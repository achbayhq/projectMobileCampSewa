import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutEditAlamat extends StatefulWidget {
  final bool edit;
  final String? namaLengkap;
  final String? noTelepon;
  final String? alamat;
  final String? detailAlamat;
  final String? ditandaiSebagai;
  const LayoutEditAlamat(
      {super.key,
      required this.edit,
      this.namaLengkap,
      this.noTelepon,
      this.alamat,
      this.detailAlamat,
      this.ditandaiSebagai});

  @override
  State<LayoutEditAlamat> createState() => _LayoutEditAlamatState();
}

class _LayoutEditAlamatState extends State<LayoutEditAlamat> {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController detailAlamatController = TextEditingController();
  String ditandaiSebagai = "rumah";

  @override
  void initState() {
    if (widget.edit) {
      namaLengkapController.text = widget.namaLengkap ?? "";
      noTeleponController.text = widget.noTelepon ?? "";
      alamatController.text = widget.alamat ?? "";
      detailAlamatController.text = widget.detailAlamat ?? "";
      ditandaiSebagai = widget.ditandaiSebagai ?? "rumah";
    }
    super.initState();
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    noTeleponController.dispose();
    alamatController.dispose();
    detailAlamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: MediaQuery.of(context).size.width / 4 - 15,
                    ),
                    Text(
                      widget.edit ? "Edit Alamat" : "Alamat Baru",
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
                      top: 25, left: 25, right: 20, bottom: 5),
                  child: Text(
                    "Kontak",
                    style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      child: TextField(
                        controller: namaLengkapController,
                        decoration: InputDecoration(
                            hintText: "Nama Lengkap",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14.5, fontWeight: FontWeight.w500),
                            border: InputBorder.none),
                        style: GoogleFonts.poppins(
                            fontSize: 14.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: TextField(
                        controller: noTeleponController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Nomor Telepon Aktif",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14.5, fontWeight: FontWeight.w500),
                            border: InputBorder.none),
                        style: GoogleFonts.poppins(
                            fontSize: 14.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 25, right: 20, bottom: 5),
                  child: Text(
                    "Alamat",
                    style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  //pilih alamat
                                },
                                child: TextField(
                                  controller: alamatController,
                                  enabled: false,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Provinsi, Kota, Kecamatan, Kode Pos",
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                      border: InputBorder.none),
                                  style: GoogleFonts.poppins(
                                      fontSize: 13, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.navigate_next_rounded,
                              size: 25,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: TextField(
                        controller: detailAlamatController,
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText:
                                "Detail Lainnya (Contoh: {Nama Jalan, Blok, No Rumah)",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14.5, fontWeight: FontWeight.w500),
                            border: InputBorder.none),
                        style: GoogleFonts.poppins(
                            fontSize: 14.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 25, right: 20, bottom: 5),
                  child: Text(
                    "Tandai Sebagai",
                    style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          ditandaiSebagai = "rumah";
                        });
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                          color: ditandaiSebagai == "rumah"
                              ? const Color(0xFF010935)
                              : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ditandaiSebagai == "rumah"
                                  ? "assets/icons/alamat-home-selected.png"
                                  : "assets/icons/alamat-home.png",
                              scale: 2,
                            ),
                            Text(
                              "Rumah",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: ditandaiSebagai == "rumah"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          ditandaiSebagai = "kantor";
                        });
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                          color: ditandaiSebagai == "kantor"
                              ? const Color(0xFF010935)
                              : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ditandaiSebagai == "kantor"
                                  ? "assets/icons/alamat-office-selected.png"
                                  : "assets/icons/alamat-kantor.png",
                              scale: 2,
                            ),
                            Text(
                              "Kantor",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: ditandaiSebagai == "kantor"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF010935),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Simpan",
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                widget.edit
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 15 , bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFCD1B1B),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Hapus Alamat",
                                style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
