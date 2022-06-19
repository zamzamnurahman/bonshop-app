import 'package:bonshop_apps/homepage.dart';
import 'package:bonshop_apps/models/form.dart';
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
  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  var _ttl;

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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
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
