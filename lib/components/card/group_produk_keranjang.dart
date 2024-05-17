import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_camp_sewa/components/card/keranjang_card.dart';

class GroupProdukKeranjang extends StatefulWidget {
  final String? namaToko;
  const GroupProdukKeranjang({super.key, this.namaToko});

  @override
  State<GroupProdukKeranjang> createState() => _GroupProdukKeranjangState();
}

class _GroupProdukKeranjangState extends State<GroupProdukKeranjang> {
  bool dipilihSemua = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(25)),
          border: Border.symmetric(
              vertical:
                  BorderSide(color: Colors.black.withOpacity(0.3), width: 1)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF494949).withOpacity(0.35),
                offset: const Offset(-2.0, 3.0),
                blurRadius: 2.0)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF010935),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      value: dipilihSemua,
                      onChanged: (bool? value) {
                        setState(() {
                          dipilihSemua = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        "assets/icons/icon-store.png",
                        scale: 2,
                      ),
                    ),
                    Text(
                      widget.namaToko!,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) => const ItemKeranjangCard(),
                itemCount: 3),
          ],
        ),
      ),
    );
  }
}
