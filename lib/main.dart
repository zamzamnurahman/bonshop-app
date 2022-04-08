import 'package:bonshop/login.dart';
import 'package:bonshop/spalshscreen.dart';
import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bonshop/dashboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          height: 264,
                          width: 291,
                          decoration: BoxDecoration(
                            color: putih,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/image2.png',
                            fit: BoxFit.cover,
                            scale: 0.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                          height: 264,
                          width: 291,
                          decoration: BoxDecoration(
                            color: putih,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/image3.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 50),
                        child: Container(
                          height: 264,
                          width: 291,
                          decoration: BoxDecoration(
                            color: putih,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/image2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Bonsai Soviet',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: hijau,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'bonsai soviet, memiliki bentuk yang sangat menyerupai pohon beringin. ciri khas dari tanaman hias bonsai ini adaalh lengkukan dari batangnya yang cukup menarik',
                  style: GoogleFonts.poppins(color: abuabu),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              FloatingActionButton(
                onPressed: () {
                  Get.to(login());
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
