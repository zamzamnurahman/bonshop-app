import '../models/data.dart';

class Data {
  static List<DataTanamanModel> getData() {
    return [
      DataTanamanModel(
        id: 1,
        judul: "Bunga Kopi",
        deskripsi:
            "Bunga Kopi yang bisa menjadi salah satu Tanaman hias coko dengan kenyaman berbau kopi di ruangan",
        harga: 15000,
        jenis: "bunga",
        gambar: "jual1.png",
        subGambar: "hallooo",
      ),
      DataTanamanModel(
        id: 2,
        judul: "Bunga Daun Taman puring",
        deskripsi:
            "Bunga Daun Taman puring yang banyak sekali manfaat nya mulai dari daun nya yang bis adijadikan obat dan wangi dari bungan hias ini snagat khas dan banyak yang suka menggunakan pewangi ruangan dengan salah satu tanaman hias ini",
        harga: 20000,
        jenis: "bunga",
        gambar: "image4.png",
        subGambar: "kslhflksflkhskl",
      ),
      DataTanamanModel(
        id: 3,
        judul: "Daun Monstera",
        deskripsi:
            "Daun Monstrea memili keanehan tetapi bungan hias ini tanpa sadar memiliki keindagan pada batang daun nya yang sangat unik",
        harga: 22000,
        jenis: "bunga",
        gambar: "image3.png",
      ),
    ];
  }
}
