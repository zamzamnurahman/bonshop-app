import 'package:bonshop/profile.dart';
import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard extends StatefulWidget {
  final String? nama;
  final String? email;
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
                  Expanded(
                    flex: 4,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Selamat datang,',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: abuabu,
                        ),
                      ),
                      TextSpan(
                        text: '\n${widget.nama}',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: hijauTua,
                        ),
                      )
                    ])),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(
                          profile(nama: widget.nama, email: widget.email)),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: hijau,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: abuabu, width: 1),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: abuabu,
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(-3, 2))
                            ]),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const TextField(
                                  decoration: InputDecoration(
                                hintText: 'Cari tanaman ..',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: abuabu,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_alt_rounded,
                            color: Colors.black87,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Text('hias Bunga',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: hijauTua,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text('hias Bonsai',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: abuabu,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text('hias Daun',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: abuabu,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text('hias Mawar',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: abuabu,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
              ),
              Container(
                child: Container(
                    child: Column(
                  children: [
                    Image.asset(
                      'assets/images/images2.png',
                      scale: 5,
                    )
                  ],
                )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
