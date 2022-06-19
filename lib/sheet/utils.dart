import 'package:flutter/material.dart';

import '../models/card.dart';

class Utils {
  static List<CardContent> getCardContent() {
    return [
      CardContent(
          pesan:
              "Bonshop atau Kebon Shop, merupakan sebuah marketplaceyang berfokus pada penjualan tanaman hias, bibit kebun, dan lainnya yang berhubungan dengan prekebunan.",
          gambar: "toko.png",
          judul: "Bonshop Marketplace"),
      CardContent(
        pesan:
            "pada aplikasi ini disajikan beragam jenis tanaman mulai dari tanaman hias, tanaman kebun kebunan dan juga tanaman bunga.",
        gambar: "garden1.png",
        judul: "Berbagai Macam Tanaman",
      ),
      CardContent(
        pesan:
            "kamu bisa menjual dan juga membeli tanaman di aplikasi ini. dengan sistem transaksi yang terpecaya dan pengiriman dengan langsung di antar kan ke depan rumah.",
        gambar: "garden2.png",
        judul: "Berbagi dan Pelihara",
      ),
    ];
  }
}
