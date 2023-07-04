import 'package:diary/common.dart';
import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  final Icon ?icon;
  final String? hintText;
  final TextEditingController?controller;
  final  Widget ? suffixIcon;
  const InputBoxWidget({super.key,  this.icon,  this.hintText, this.controller, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w),
      elevation: 11,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.w))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hintText??"",
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon:suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.w)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w)),
      ),
    );
  }
}

