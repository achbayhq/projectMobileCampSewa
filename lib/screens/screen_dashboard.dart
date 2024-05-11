import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_camp_sewa/layouts/layout_dashboard.dart';
import 'package:project_camp_sewa/layouts/layout_product.dart';
import 'package:project_camp_sewa/screens/screen_riwayat.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  int pageIndex = 0;
  List pages = const [LayoutDashboard(), LayoutProduct(), RiwayatScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    strokeAlign: BorderSide.strokeAlignOutside,
                    width: 2.4)),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
          child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.black.withOpacity(0.25),
              gap: 4,
              padding: const EdgeInsets.all(10),
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  iconSize: 30,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.dashboard_rounded,
                  iconSize: 30,
                  text: "Produk",
                ),
                GButton(
                  icon: Icons.assignment,
                  iconSize: 30,
                  text: "Riwayat",
                ),
                GButton(
                  icon: Icons.account_box,
                  iconSize: 30,
                  text: "Profile",
                ),
              ]),
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
