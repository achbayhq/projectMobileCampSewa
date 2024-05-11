import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemVariant extends StatefulWidget {
  final Color warnaBg;
  final Color warnaTeks;
  final String item;
  const ItemVariant({super.key, this.warnaBg = Colors.white, this.warnaTeks = Colors.black, required this.item});

  @override
  State<ItemVariant> createState() => _ItemVariantState();
}

class _ItemVariantState extends State<ItemVariant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.2),
          borderRadius: BorderRadius.circular(5),
          color: widget.warnaBg),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            widget.item,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: widget.warnaTeks),
          ),
        ),
      ),
    );
  }
}
