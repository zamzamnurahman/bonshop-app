import 'package:bonshop_apps/login_page.dart';
import 'package:bonshop_apps/models/card.dart';
import 'package:bonshop_apps/sheet/utils.dart';
import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<CardContent> content = Utils.getCardContent();
  PageController _pageC = PageController();
  int pageIndex = 0;

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
                  controller: _pageC,
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  children: List.generate(
                    content.length,
                    (index) => Container(
                      padding: const EdgeInsets.only(
                        top: 70,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Image.asset(
                                'assets/images/${content[index].gambar}',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "${content[index].judul}",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: kHijau),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "${content[index].pesan}",
                                style: const TextStyle(
                                  fontSize: 14,
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
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: List.generate(
                              content.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      _pageC.animateTo(
                                        MediaQuery.of(context).size.width *
                                            index,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                          color: kHijau,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: pageIndex == index
                                                  ? kHijauMuda
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            alignment: Alignment.bottomRight,
                            margin: const EdgeInsets.only(bottom: 40, right: 40),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child:  Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 30)),
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
