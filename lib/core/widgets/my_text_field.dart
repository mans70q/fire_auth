import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;

  const MyTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: text,
      ),
    );
  }
}
