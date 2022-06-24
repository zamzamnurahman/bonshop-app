import 'package:bonshop_apps/homepage.dart';
import 'package:bonshop_apps/login_page.dart';
import 'package:bonshop_apps/models/form.dart';
import 'package:bonshop_apps/models/users.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
  DateTime? currentDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2045),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
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
          const Center(
            child: Text(
              "Daftar",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: kHijau),
            ),
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
                  icon: const Icon(
                    Icons.person,
                    color: kHijauTua,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  hints: currentDate == null
                      ? 'Pilih Tanggal Lahir'
                      : currentDate.toString().substring(0, 10),
                  label: currentDate == null
                      ? 'Tanggal Lahir'
                      : currentDate.toString().substring(0, 10),
                  readOnly: true,
                  function: () => _selectDate(context),
                  icon: const Icon(
                    Icons.date_range,
                    color: kHijauTua,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  controller: _email,
                  hints: 'bonshop@gmail.com',
                  label: "Alamat Email",
                  icon: const Icon(
                    Icons.email,
                    color: kHijauTua,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormInput(
                  controller: _pass,
                  hints: 'Masukkan Password',
                  label: "Password",
                  icon: const Icon(
                    Icons.lock,
                    color: kHijauTua,
                  ),
                  isObsecure: true,
                ),
                const SizedBox(
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
                              tanggalLahir:
                                  currentDate.toString().substring(0, 10),
                              email: _email.text,
                              password: _pass.text,
                            ),
                          );
                        }));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kHijau,
                  ),
                  child: const Text("Daftar"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? ",
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: const Text("Masuk",
                            style: TextStyle(
                                fontSize: 12,
                                color: kHijau,
                                fontWeight: FontWeight.bold)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nama.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }
}
