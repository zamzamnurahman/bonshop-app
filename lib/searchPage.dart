import 'package:bonshop_apps/detailt_page.dart';
import 'package:bonshop_apps/models/data.dart';
import 'package:bonshop_apps/models/form.dart';
import 'package:bonshop_apps/models/users.dart';
import 'package:bonshop_apps/sheet/data_tanaman.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  User? data;
  SearchPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataTanamanModel> data = Data.getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Tanaman Hias',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kHijau,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: FormInput(
              hints: 'Silahkan Cari...',
              label: 'Cari',
              icon: Icon(
                Icons.search,
                color: kHijau,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("hasil Pencarian"),
          ),
          Container(
            child: Column(
              children: List.generate(
                data.length,
                (index) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
            ),
          )
        ],
      )),
    );
  }
}
