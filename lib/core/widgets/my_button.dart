import 'package:flutter/material.dart';

import '../constant/colors.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Function()? onPressed;
  final Widget widget;
  const MyButton({super.key, required this.widget, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: color ?? AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: widget,
    );
  }
}
