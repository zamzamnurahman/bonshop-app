import 'package:bonshop/dashboard.dart';
import 'package:bonshop/main.dart';
import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  // controller for the text field
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nama,
                decoration: InputDecoration(
                  hintText: 'nama lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print(_email.text);
                  print(_nama.text);
                  Get.offAll(() => dashboard());
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }

  // dispose the controller when the widget is disposed
  // @override
  // void dispose() {
  //   _nama.dispose();
  //   _email.dispose();
  //   super.dispose();
  // }

}
