import 'package:bonshop/models/cardContent.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<CardContent> getCardContent() {
    return [
      CardContent(
          pesan:
              "Bonshop adalah marketplasce untuk berbagai tanaman hias, ya seperti pada gambar yaitu tanaman hias bonsai",
          gambar: "image2.png",
          judul: "Bonshop Marketplace"),
      CardContent(
        pesan:
            "berbagai tanaman hias bisa kita lihat dan bisa juga yang kita ingin dapatkan",
        gambar: "image4.png",
        judul: "Isi Aplikasi",
      ),
      CardContent(
        pesan:
            "jangan khawatir, layanan kami akan bisa terjamin dan terjaga untuk tanaman tersebut sampai ke anda",
        gambar: "image3.png",
        judul: "Bergabung bersama kami",
      ),
    ];
  }
}
