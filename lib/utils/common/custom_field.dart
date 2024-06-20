import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool? obscureText = false;
  CustomField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.obscureText,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
          obscureText: obscureText = false,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            hintText: hintText,
          )),
    );
  }
}
