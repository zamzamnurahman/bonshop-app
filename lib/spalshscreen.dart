
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:bonshop/main.dart';
import 'package:bonshop/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('assets/images/logo.png'),
            height: 50,
            width: double.infinity,
          ),
          Text(
            'Bonshop',
            style: GoogleFonts.poppins(
                fontSize: 25, fontWeight: FontWeight.bold, color: hijau),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text('mulai'),
          )
        ],
      )),
    );
  }
}
