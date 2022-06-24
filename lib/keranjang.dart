import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/sheet/data_tanaman.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  List? keranjang;
  List? total;
  Keranjang({Key? key, this.keranjang, this.total}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  List<DataTanamanModel> data = Data.getData();
  bool? isKlik = false;
  int? totalRupiah = 0;
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
              margin: const EdgeInsets.only(bottom: 200),
              child: Column(
                children: List.generate(
                    widget.keranjang!.length,
                    (index) => ListKeranjang(
                          gambar: '${widget.keranjang?[index].gambar}',
                          nama: '${widget.keranjang?[index].judul}',
                          harga: '${widget.keranjang?[index].harga}',
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
                    Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'total : ',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      TextSpan(
                          text:
                              'Rp: ${widget.total![0] * widget.total!.length}',
                          style: const TextStyle(
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
                      onPressed: () {
                        print(widget.keranjang![0].gambar);
                      },
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

class ListKeranjang extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3, 2),
                          blurRadius: 5)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SizedBox(
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
        ],
      ),
    );
  }
}
