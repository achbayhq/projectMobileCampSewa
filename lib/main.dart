import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project_camp_sewa/screens/get_started.dart';
import 'package:project_camp_sewa/screens/screen_dashboard.dart';
import 'package:project_camp_sewa/screens/screen_register.dart';
import 'package:project_camp_sewa/screens/splash_screen.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF32363F),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
        routes: {
          '/dashboard': (context) => const ScreenDashboard(),
        },
        debugShowCheckedModeBanner: false,
        title: "KampSewa",
        // home: const ScreenDashboard(),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(color: Color(0xFF32363F)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return const LinearGradient(
                              begin: Alignment
                                  .bottomCenter, // Mulai dari atas kiri
                              end: Alignment
                                  .topCenter, // Berakhir di bawah kanan
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [
                                0,
                                0.5
                              ]).createShader(rect);
                        },
                        blendMode: BlendMode
                            .dstIn, // Untuk memotong bagian yang tidak digunakan
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage("assets/images/test.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
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
    var firstControlPoint = Offset(size.width / 5, size.height);
    // Menentukan titik akhir kurva Bezier pertama
    var firstEndPoint = Offset(size.width / 2, size.height - 0);
    // Menambahkan kurva Bezier pertama ke path
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    // Menentukan titik kontrol kedua untuk kurva Bezier kedua
    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height - 0);
    // Menentukan titik akhir kurva Bezier kedua
    var secondEndPoint = Offset(size.width, size.height - 80);
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
