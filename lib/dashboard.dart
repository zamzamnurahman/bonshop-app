import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard extends StatefulWidget {
  String? nama;
  String? email;
  dashboard({Key? key, this.nama, this.email})
      : super(
          key: key,
        );

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang,',
                        style: GoogleFonts.poppins(fontSize: 20, color: abuabu),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '${widget.nama}',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: hijau),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/profile.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
