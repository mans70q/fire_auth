import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String text;
  final bool? obscureText;

  const MyTextField({
    super.key,
    required this.text,
    this.controller,
    this.obscureText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscureText = false;
@override
  void initState() {
    super.initState();
    _isObscureText = widget.obscureText ?? false;
  }

  void changeVisibility() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscureText,
      decoration: InputDecoration(
        suffixIcon:
            widget.obscureText != null
                ? IconButton(
                  onPressed: changeVisibility,
                  icon: Icon(
                    _isObscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: widget.text,
      ),
    );
  }
}
