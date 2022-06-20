import 'package:bonshop_apps/homepage.dart';
import 'package:bonshop_apps/models/form.dart';
import 'package:bonshop_apps/models/users.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? isKlik = '';
  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _ttl = TextEditingController();

  @override
  void initState() {
    _nama;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
          ),
          const Center(
            child: Text(
              "Bonshop",
              style: TextStyle(color: kHijau, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Daftar",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: kHijau),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                FormInput(
                  controller: _nama,
                  hints: 'Masukkan nama Lengkap',
                  label: 'Nama Lengkap',
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  controller: _ttl,
                  hints: 'Masukkan Tanggal Lahir',
                  label: "Tanggal Lahir",
                  icon: const Icon(
                    Icons.date_range,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  controller: _email,
                  hints: 'Masukkan Alamat Email',
                  label: "Alamat Email",
                  icon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  controller: _pass,
                  hints: 'Masukkan Password',
                  label: "Password",
                  icon: const Icon(Icons.lock),
                  isObsecure: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: isKlik == 'kosong',
                    child: const Center(
                      child: Text("Harap isi terlebih dahulu form",
                          style: TextStyle(color: Colors.red)),
                    )),
                Visibility(
                    visible: isKlik == 'sama',
                    child: const Center(
                      child: Text(
                        "Alamat Email sudah terdaftar, Harap Ganti",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (_nama.text == '' &&
                        _ttl.text == '' &&
                        _email.text == '' &&
                        _pass.text == '') {
                      return setState(() {
                        isKlik = 'kosong';
                      });
                    } else {
                      if (_email.text == 'admin@bonshop.com') {
                        return setState(() {
                          isKlik = "sama";
                        });
                      } else {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            dataUser: User(
                              nama: _nama.text,
                              tanggalLahir: _ttl.text,
                              email: _email.text,
                              password: _pass.text,
                            ),
                          );
                        }));
                      }
                    }
                  },
                  child: Text("Masuk"),
                  style: ElevatedButton.styleFrom(
                    primary: kHijau,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
