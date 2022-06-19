import 'package:bonshop_apps/homepage.dart';
import 'package:bonshop_apps/signup.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isKlik = true;
  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 50,
                ),
              ),
              const Center(
                child: const Text(
                  "Bonshop",
                  style: const TextStyle(
                      color: kHijau, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25, color: kHijau),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: kHijau,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Masukkan Alamat Email',
                      labelText: "Email",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kHijau),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      focusColor: kHijau,
                      hintText: 'Masukkan Password',
                      labelText: "Password",
                      border: InputBorder.none),
                ),
              ),
              Visibility(
                  visible: !isKlik,
                  child: const Center(
                    child: Text("Harap isi Terlebih dahulu form",
                        style: TextStyle(color: Colors.red)),
                  )),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kHijau,
                  ),
                  onPressed: () {
                    if (_email.text != '' && _pass.text != '') {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    } else {
                      return setState(() {
                        isKlik = false;
                      });
                    }
                  },
                  child: const Text('Masuk'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("belum punya akun? ",
                      style: TextStyle(
                        fontSize: 12,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        }));
                      },
                      child: const Text("Daftar",
                          style: TextStyle(
                              fontSize: 12,
                              color: kHijau,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          )),
    );
  }
}
