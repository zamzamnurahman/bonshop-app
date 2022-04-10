import 'package:bonshop/login.dart';
import 'package:bonshop/sheet/utils.dart';
import 'package:bonshop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/cardContent.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List<CardContent> content = Utils.getCardContent();
  int pageIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.symmetric(vertical: 70),
        alignment: Alignment.center,
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  children: List.generate(
                    content.length,
                    (index) => Container(
                      padding: EdgeInsets.only(
                        top: 70,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 100,
                                        spreadRadius: 5,
                                        offset: const Offset(50, 10))
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                'assets/images/${content[index].gambar}',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "${content[index].judul}",
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: hijau),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "${content[index].pesan}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Row(
                          children: List.generate(
                              content.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      _controller.animateTo(
                                        MediaQuery.of(context).size.width *
                                            index,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutCirc,
                                      );
                                    },
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                          color: hijau,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: pageIndex == index
                                                  ? hijauMuda
                                                  : Colors.white,
                                              width: 5,
                                              style: BorderStyle.solid)),
                                    ),
                                  )),
                        ),
                      ),
                      Visibility(
                        visible: pageIndex == content.length - 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(login());
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(bottom: 40, right: 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Icon(Icons.arrow_forward,
                                    color: putih, size: 30)),
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
