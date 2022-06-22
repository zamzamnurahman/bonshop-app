import 'package:bonshop_apps/keranjang.dart';
import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DataTanamanModel data;
  DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isKlik = false;
  int? jumlah = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Keranjang();
                  }));
                },
                icon: const Icon(
                  Icons.shopping_bag,
                  color: kHijau,
                ))
          ]),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(children: [
                SizedBox(
                  child: Image.asset("assets/images/${widget.data.gambar}"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        children: List.generate(
                            3,
                            (index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100],
                                  ),
                                  child: Image.asset(
                                    "assets/images/${widget.data.gambar}",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                    Container(
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                if (jumlah! <= 0) {
                                  jumlah = 0;
                                } else {
                                  jumlah = jumlah! - 1;
                                }
                              }),
                              child: Container(
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
                            ),
                            Text("$jumlah",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            GestureDetector(
                              onTap: () => setState(() {
                                jumlah = jumlah! + 1;
                              }),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("${widget.data.judul}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kHijau,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("${widget.data.deskripsi}"),
                ),
                const SizedBox(
                  height: 100,
                )
              ]),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            primary: kHijau,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(!isKlik ? 10 : 50))),
                        onPressed: () {
                          setState(() {
                            isKlik = !isKlik ? true : false;
                          });
                        },
                        child: Text(
                          !isKlik ? "+ Tambahkan ke Keranjang" : "X",
                        )),
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
