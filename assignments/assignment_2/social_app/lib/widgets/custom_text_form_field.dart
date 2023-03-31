import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;

  const CustomTextFormField({Key? key, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintStyle: const TextStyle(
                color: Color(0XFFBDBDBD),
                fontFamily: 'Circular-Std',
                fontSize: 20),
            hintText: labelText,
            filled: true,
            fillColor: const Color(0XFFF3F5F7),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
