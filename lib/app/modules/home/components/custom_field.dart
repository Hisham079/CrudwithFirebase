import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.controller, this.validator,this.labeText='title'});
  TextEditingController? controller;
  String? Function(String?)? validator;
  String labeText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration:  InputDecoration(labelText: labeText),
        validator: validator);
  }
}
