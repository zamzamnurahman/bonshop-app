import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DataTanamanModel data;
  DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag,
                      ))
                ]),
          ),
          SizedBox(
            child: Image.asset("assets/images/${data.gambar}"),
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
                              "assets/images/${data.gambar}",
                              fit: BoxFit.cover,
                            ),
                          ))),
              Container(
                width: 100,
                height: 40,
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
                      const Text("0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      Container(
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
                          ))
                    ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("${data.judul}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kHijau,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("${data.deskripsi}"),
          ),
          Container(
            margin:const  EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: kHijau,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text("+ Tambahkan ke Keranjang")),
          )
        ]),
      ),
    );
  }
}
