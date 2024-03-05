import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_camp_sewa/components/button/button_versi1.dart';
import 'package:project_camp_sewa/components/dropdown/dropdown_search.dart';
import 'package:project_camp_sewa/components/input/input_versi1.dart';

class LayoutRegister extends StatefulWidget {
  const LayoutRegister({super.key});

  @override
  State<LayoutRegister> createState() => _LayoutRegisterState();
}

class _LayoutRegisterState extends State<LayoutRegister> {
  TextEditingController usrnmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final List<String> provinsiList = [
    'Jawa Timur',
    'Jawa Barat',
    'Jawa Tengah',
    'Jakarta',
    'Bali',
    'Kalimantan Tengah',
    'Kalimantan Barat',
    'Sulawesi Utara',
  ];
  final List<String> kabupatenList = [
    'Jember',
    'Mojokerto',
    'Tuban',
    'Banyuwangi',
    'Denpasar',
    'Ternate',
    'Lombok',
    'Solo',
  ];
  final List<String> kecamatanList = [
    'Sumbersari',
    'Tegal Baru',
    'Gempol',
    'Gedeg',
    'Talam',
    'Bangkal',
    'Kembangsari',
    'Salasatu',
  ];
  final List<String> desaList = [
    'Desa satu',
    'Desa dua',
    'Desa tiga',
    'Desa empat',
    'Desa lima',
    'Desa enam',
    'Desa tujuh',
    'Desa delapan',
  ];

  String? selectedProvinsi;
  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kabupatenController = TextEditingController();
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController desaController = TextEditingController();

  @override
  void dispose() {
    provinsiController.dispose();
    kabupatenController.dispose();
    kecamatanController.dispose();
    desaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFFE8E9EC),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: Color(0xFFE8E9EC)),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.8,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/58/bc/c7/senaru-crater-rim-2-days.jpg?w=1200&h=-1&s=1"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("REGISTRASI",
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
              child: InputVersiSatu(
                controller: usrnmController,
                tipeInput: TextInputType.name,
                showEyes: false,
                iconInput: const Icon(Icons.person_outline),
                placeHolder: "Username",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
              child: InputVersiSatu(
                controller: emailController,
                tipeInput: TextInputType.emailAddress,
                showEyes: false,
                iconInput: const Icon(Icons.email_rounded),
                placeHolder: "Email",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
              child: InputVersiSatu(
                controller: phoneController,
                tipeInput: TextInputType.phone,
                showEyes: false,
                iconInput: const Icon(Icons.phone),
                placeHolder: "No.Telephone",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
              child: InputVersiSatu(
                // passwordTipe: true,
                controller: passController,
                placeHolder: "Password",
                showEyes: true,
                passwordTipe: true,
                iconInput: const Icon(Icons.key_outlined),
                tipeInput: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: dateController,
                    onTap: () {
                      _selectDate(context);
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.date_range),
                      hintText: "Tanggal Lahir",
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                    ),
                  )),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
                child: CustomDropdown(
                    hint: "Select Provinsi",
                    value: selectedProvinsi,
                    dropdownItems: provinsiList,
                    onChanged: (value) {
                      setState(() {
                        selectedProvinsi = value;
                      });
                    },
                    dropdownWidth: 250,
                    buttonWidth: 450,
                    buttonHeight: 50,
                    dropdownSearchData: DropdownSearchData(
                      searchController: provinsiController,
                      searchInnerWidgetHeight: 100,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: provinsiController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari Provinsi...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        provinsiController.clear();
                      }
                    })),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
                child: CustomDropdown(
                    hint: "Select Kabupaten",
                    value: selectedKabupaten,
                    dropdownItems: kabupatenList,
                    onChanged: (value) {
                      setState(() {
                        selectedKabupaten = value;
                      });
                    },
                    dropdownWidth: 250,
                    buttonWidth: 450,
                    buttonHeight: 50,
                    dropdownSearchData: DropdownSearchData(
                      searchController: kabupatenController,
                      searchInnerWidgetHeight: 100,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: kabupatenController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari Kabupaten...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        kabupatenController.clear();
                      }
                    })),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
                child: CustomDropdown(
                    hint: "Select Kecamatan",
                    value: selectedKecamatan,
                    dropdownItems: kecamatanList,
                    onChanged: (value) {
                      setState(() {
                        selectedKecamatan = value;
                      });
                    },
                    dropdownWidth: 250,
                    buttonWidth: 450,
                    buttonHeight: 50,
                    dropdownSearchData: DropdownSearchData(
                      searchController: kecamatanController,
                      searchInnerWidgetHeight: 100,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: kecamatanController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari Kecamatan...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        kecamatanController.clear();
                      }
                    })),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 4),
                child: CustomDropdown(
                    hint: "Select Desa",
                    value: selectedDesa,
                    dropdownItems: desaList,
                    onChanged: (value) {
                      setState(() {
                        selectedDesa = value;
                      });
                    },
                    dropdownWidth: 250,
                    buttonWidth: 450,
                    buttonHeight: 50,
                    dropdownSearchData: DropdownSearchData(
                      searchController: desaController,
                      searchInnerWidgetHeight: 100,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: desaController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Cari Desa...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        desaController.clear();
                      }
                    })),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: ButtonVersiSatu(
                  aksi: () {
                    // Navigator.push(
                    //     context, PageRouteBuilder(pageBuilder: HomePage()));
                  },
                  lebarFull: true,
                  title: "Login",
                  bgTombol: const Color(0xFF71480A)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun?", style: GoogleFonts.poppins()),
                      const SizedBox(width: 5),
                      Text("Login!",
                          style: GoogleFonts.poppins(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Membuat objek path untuk menentukan area yang akan dipotong
    var path = Path();
    // Menentukan titik awal path (pojok kiri atas)
    path.lineTo(0, size.height - 80);
    // Menentukan titik kontrol pertama untuk kurva Bezier pertama
    var firstControlPoint = Offset(size.width / 4, size.height);
    // Menentukan titik akhir kurva Bezier pertama
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    // Menambahkan kurva Bezier pertama ke path
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    // Menentukan titik kontrol kedua untuk kurva Bezier kedua
    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    // Menentukan titik akhir kurva Bezier kedua
    var secondEndPoint = Offset(size.width, size.height - 20);
    // Menambahkan kurva Bezier kedua ke path
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    // Menambahkan garis lurus ke pojok kanan bawah
    path.lineTo(size.width, size.height - 40);
    // Menambahkan garis lurus ke pojok kanan atas
    path.lineTo(size.width, 0);
    // Menutup path sehingga area yang ditentukan oleh path akan dipotong
    path.close();
    // Mengembalikan path yang telah dibuat
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Metode ini digunakan untuk menentukan apakah path perlu dipotong ulang
    // Di sini, kita mengembalikan false karena path tidak perlu diubah.
    return true;
  }
}
