import 'package:bonshop/main.dart';
import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  int? duration = 0;
  Widget? goToPage;

  SplashScreen({this.duration, this.goToPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration!), () => Get.off(goToPage));

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.png',
            width: 40,
            height: 45,
          ),
          Text('Bonshop',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold, color: hijauTua)),
        ]),
      ),
    );
  }
}
