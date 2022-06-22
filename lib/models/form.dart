import 'package:bonshop_apps/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme.dart';

class FormInput extends StatelessWidget {
  TextEditingController? controller;
  Widget? icon;
  String? hints, label;
  bool? isObsecure;
  bool? readOnly;
  void Function()? function;

  FormInput(
      {this.controller,
      this.hints,
      this.label,
      this.icon,
      this.isObsecure,
      this.readOnly,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kHijau,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: function ?? () {},
        readOnly: readOnly ?? false,
        controller: controller,
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
            icon: icon,
            hintText: '$hints',
            hintStyle: TextStyle(color: kHijau),
            labelText: "$label",
            labelStyle: TextStyle(color: kHijau),
            border: InputBorder.none),
      ),
    );
  }
}
