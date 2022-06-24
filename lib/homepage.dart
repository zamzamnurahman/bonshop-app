import 'package:bonshop_apps/detailt_page.dart';
import 'package:bonshop_apps/keranjang.dart';
import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/models/form.dart';
import 'package:bonshop_apps/models/users.dart';
import 'package:bonshop_apps/profile.dart';
import 'package:bonshop_apps/searchPage.dart';
import 'package:bonshop_apps/sheet/data_tanaman.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  User? dataUser;
  HomePage({Key? key, this.dataUser}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(
        dataUser: dataUser,
      );
}

class _HomePageState extends State<HomePage> {
  User? dataUser;
  _HomePageState({this.dataUser});

  List<DataTanamanModel> data = Data.getData();

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Selamat Datang,"),
                    Text("${dataUser?.nama}",
                        style: const TextStyle(
                            fontSize: 22,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: kHijauTua)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Profile(
                    dataUser: dataUser,
                  );
                })),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Hero(
                    tag: 'bonshop',
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 1,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormInput(
            function: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return SearchPage();
            })),
            readOnly: true,
            icon: const Icon(
              Icons.search,
              size: 30,
              color: kHijau,
            ),
            label: "Cari Tanaman Terbaik",
            hints: '',
          ),
        ),
        Container(
          // color: Colors.blue,
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 0;
                }),
                child: Text("Hias Bunga",
                    style: TextStyle(
                      fontSize: index == 0 ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? kHijau : Colors.black26,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 1;
                }),
                child: Text("Hias Bonsai",
                    style: TextStyle(
                      fontSize: index == 1 ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: index == 1 ? kHijau : Colors.black26,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 2;
                }),
                child: Text("Hias Daun",
                    style: TextStyle(
                      fontSize: index == 2 ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: index == 2 ? kHijau : Colors.black26,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 3;
                }),
                child: Text("Hias Lainnya",
                    style: TextStyle(
                      fontSize: index == 3 ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: index == 3 ? kHijau : Colors.black26,
                    )),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                data.length,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(4, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: Column(children: [
                        Image.asset('assets/images/${data[index].gambar}'),
                        Text(
                          "${data[index].judul}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kHijauTua,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("RP.${data[index].harga}",
                            style: const TextStyle(color: kHijau)),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kHijau,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DetailPage(data: data[index]);
                            }));
                          },
                          child: const Text("Detail"),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                    )),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: const Text("Daftar Tanaman Hias Bunga",
              style: TextStyle(
                fontSize: 20,
                color: kHijauTua,
                fontWeight: FontWeight.bold,
              )),
        ),
        Column(
          children: List.generate(
            data.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(2, 4),
                      blurRadius: 5,
                    )
                  ]),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                isThreeLine: true,
                leading: Image.asset(
                  "assets/images/${data[index].gambar}",
                ),
                title: Text("${data[index].judul}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kHijauTua,
                      overflow: TextOverflow.ellipsis,
                    )),
                subtitle: Text("Rp.${data[index].harga}"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kHijau),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DetailPage(data: data[index]);
                    }));
                  },
                  child: const Text("detail"),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
