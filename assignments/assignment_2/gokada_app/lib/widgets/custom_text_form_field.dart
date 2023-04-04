import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  const CustomTextFormField({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
        fillColor: Colors.white,
        labelText: text,
        labelStyle: const TextStyle(fontSize: 20),
      ),
    );
  }
}
