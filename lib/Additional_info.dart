import 'dart:ffi';
import 'package:flutter/material.dart';

class Additional extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  const Additional({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
          size: 45,),
        Text(text, style: TextStyle(
          fontSize: 18,
        ),
        ),
        Text(value,style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}