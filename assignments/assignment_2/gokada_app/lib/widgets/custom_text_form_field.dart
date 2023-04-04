import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  const CustomTextFormField({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
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
      ),
    );
  }
}
