import 'package:bonshop_apps/theme.dart';
import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  bool? isKlik = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        )),
                  ),
                  const Text(
                    "Keranjang",
                    style: TextStyle(
                      fontSize: 24,
                      color: kHijau,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(
                  3,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                          title: const Text('Nama Tanaman Hias'),
                          subtitle: const Text("Harga Rp."),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kHijau,
                            ),
                            onPressed: () {},
                            child: const Text("+"),
                          ),
                        ),
                      )),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: isKlik == true ? 300 : 150,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(4, -5),
                  blurRadius: 6,
                )
              ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isKlik = isKlik! ? false : true;
                    }),
                    child: isKlik == true
                        ? const Icon(
                            Icons.arrow_downward,
                          )
                        : const Icon(
                            Icons.arrow_upward,
                          ),
                  ),
                ),
                Visibility(
                  visible: isKlik == false ? false : true,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Metode Pembayaran :",
                            style: TextStyle(
                                color: kHijau, fontWeight: FontWeight.bold)),
                        Text("- Cash On Delivery",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("- Mobile Banking",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("- E-Wallet",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'total : ',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      TextSpan(
                          text: 'Rp: total Rupiah',
                          style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: kHijauTua,
                          ))
                    ])),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kHijauMuda,
                          minimumSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            25,
                          ))),
                      onPressed: () {},
                      child: const Text("Beli"),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ])),
    );
  }
}
