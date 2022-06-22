import 'package:bonshop_apps/login_page.dart';
import 'package:bonshop_apps/models/users.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  User? dataUser;
  Profile({Key? key, this.dataUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  })),
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 150,
              width: 150,
              child: Hero(
                  tag: 'bonshop', child: Image.asset('assets/images/logo.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${(dataUser?.nama) ?? 'Bonshop'}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kHijauTua,
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 3),
                              blurRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        (dataUser?.email) ?? 'Bonshop@officialy.com',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 3),
                              blurRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        (dataUser?.tanggalLahir) ?? '2001-07-27',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 3),
                              blurRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Alamat sesuai KTP",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Text(
                "Tentang\n ZedProduction 2022",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
