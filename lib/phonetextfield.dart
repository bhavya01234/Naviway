import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PhoneTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Phone',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
