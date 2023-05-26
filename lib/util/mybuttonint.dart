import 'package:flutter/material.dart';

class MyButtonInt extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final Object number;

  MyButtonInt({super.key, this.icon, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            height: 6,
          ),
          Text("$number"),
        ],
      ),
    );
  }
}
