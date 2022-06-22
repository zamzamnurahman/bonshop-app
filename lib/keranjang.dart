import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/sheet/data_tanaman.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  List<DataTanamanModel> data = Data.getData();
  bool? isKlik = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Keranjang",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: kHijau)),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(children: [
        ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Daftar Tanaman Hias di Keranjang Anda.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 700,
              margin: EdgeInsets.only(bottom: 100),
              child: Column(
                children: List.generate(
                    data.length,
                    (index) => ListKeranjang(
                          gambar: '${data[index].gambar}',
                          nama: '${data[index].judul}',
                          harga: '${data[index].harga}',
                        )),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: isKlik == true ? 300 : 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(4, -1),
                      blurRadius: 6,
                    )
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isKlik = isKlik! ? false : true;
                    }),
                    child: isKlik == true
                        ? const Icon(
                            Icons.arrow_downward,
                          )
                        : const Icon(
                            Icons.arrow_upward,
                          ),
                  ),
                ),
                Visibility(
                  visible: isKlik == false ? false : true,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Metode Pembayaran :",
                            style: TextStyle(
                                color: kHijau, fontWeight: FontWeight.bold)),
                        Text("- Cash On Delivery",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("- Mobile Banking",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("- E-Wallet",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'total : ',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      TextSpan(
                          text: 'Rp: total Rupiah',
                          style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: kHijauTua,
                          ))
                    ])),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kHijau,
                          minimumSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            25,
                          ))),
                      onPressed: () {},
                      child: const Text("Beli"),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ])),
    );
  }
}

class ListKeranjang extends StatefulWidget {
  String? gambar, nama, harga;
  int? jumlah;

  ListKeranjang({
    Key? key,
    this.gambar,
    this.nama,
    this.harga,
    this.jumlah,
  }) : super(key: key);

  @override
  State<ListKeranjang> createState() => _ListKeranjangState(
        gambar: gambar,
        nama: nama,
        harga: harga,
        jumlah: jumlah,
      );
}

class _ListKeranjangState extends State<ListKeranjang> {
  String? gambar, nama, harga;
  int? jumlah;
  _ListKeranjangState({
    this.gambar,
    this.nama,
    this.harga,
    this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    int? jumlahBeli = 0;
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100]),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/images/$gambar'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$nama",
                                style: const TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text("Rp.$harga")
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            width: 100,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text("-",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  Text("${(jumlahBeli)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  GestureDetector(
                    onTap: () {
                      print('tambah');
                      setState(() {
                        jumlahBeli = jumlahBeli! + 1;
                      });
                    },
                    child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text("+",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
