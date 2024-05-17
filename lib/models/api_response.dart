import 'package:project_camp_sewa/models/riwayat_model.dart';

class ApiResponse {
  Object? data;
  String? error;
}

class DummyProductApiResponse {
  static final Map<String, dynamic> apiProductResponse = {
    "status": "success",
    "data": [
      {
        'id': 1,
        'nama_toko': "Abay Store",
        'nama_produk': "The Nort Face 4 ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'deskripsi_produk': "Size XL / Hitam",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Belum Lunas"
      },
      {
        'id': 2,
        'nama_toko': "Gungzle Shop",
        'nama_produk': "Tendaaaaa",
        'foto_produk': "assets/images/produk2.jpeg",
        'qty': "2",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "3",
        'rating': "4.8",
        'harga': "35000",
        'total_pesanan': "160000",
        'durasi': "3",
        'status_transaksi': "Belum Lunas"
      },
      {
        'id': 3,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Belum Lunas"
      },
      {
        'id': 4,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Belum Lunas"
      },
      {
        'id': 5,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Belum Lunas"
      },
      {
        'id': 6,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Belum Lunas"
      },
    ]
  };

  static final Map<String, dynamic> apiRiwayatPengambilanResponse = {
    "status": "success",
    "data": [
      {
        'id': 1,
        'nama_toko': "Mutiara Store",
        'nama_produk': "Tenda Model Bagus",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Lunas"
      },
      {
        'id': 2,
        'nama_toko': "Gungzle Shop",
        'nama_produk': "Tendaaaaa",
        'foto_produk': "assets/images/produk2.jpeg",
        'qty': "2",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "3",
        'rating': "4.8",
        'harga': "35000",
        'total_pesanan': "160000",
        'durasi': "3",
        'status_transaksi': "Lunas"
      },
      {
        'id': 3,
        'nama_toko': "Anggi Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Lunas"
      },
      {
        'id': 4,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Lunas"
      },
      {
        'id': 5,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Lunas"
      },
      {
        'id': 6,
        'nama_toko': "Bintang Shop",
        'nama_produk': "Tenda Model Baru ",
        'foto_produk': "assets/images/produk1.jpeg",
        'qty': "3",
        'ukuran': "XL",
        'warna': "Hitam",
        'qty_produk_lain': "5",
        'rating': "4.5",
        'harga': "50000",
        'total_pesanan': "290000",
        'durasi': "5",
        'status_transaksi': "Lunas"
      },
    ]
  };

  static List<RiwayatModel> getRiwayatData() {
    List<dynamic> riwayatData = apiProductResponse['data'];
    return riwayatData.map((data) => RiwayatModel.fromJson(data)).toList();
  }
  static List<RiwayatModel> getRiwayatPengambilanData() {
    List<dynamic> riwayatData = apiRiwayatPengambilanResponse['data'];
    return riwayatData.map((data) => RiwayatModel.fromJson(data)).toList();
  }
}
