import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdukTerlarisDashboard extends StatefulWidget {
  const ProdukTerlarisDashboard({super.key});

  @override
  State<ProdukTerlarisDashboard> createState() =>
      _ProdukTerlarisDashboardState();
}

class _ProdukTerlarisDashboardState extends State<ProdukTerlarisDashboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 180,
        height: 235,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF494949).withOpacity(0.3),
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 5.0)
            ]),
        child: Column(
          children: [
            Container(
              width: 175,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/produk1.jpeg"))),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 30,
                        child: Text(
                          "Borneo 4 double layer kapasitas 4 orang",
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w600),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        //Ini ku pisah pisah supaya ketika ambil harga di database ngga usah nambahin IDR dulu
                        children: [
                          Text(
                            "IDR. ",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "20.000",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "/hari",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "4.5",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    //button keranjangnya
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/icons/keranjang-add-product.png"),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
