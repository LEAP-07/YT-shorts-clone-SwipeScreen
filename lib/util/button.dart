import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final int? number;

  MyButton({super.key, this.icon, this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(number.toString()),
        ],
      ),
    );
  }
}
