import 'package:flutter/material.dart';

class RowInput extends StatelessWidget {
  final String label;
  void Function(String result) onChanged;

  RowInput({required this.label, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
        TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: label,
          ),
          onChanged: onChanged,
        )
      ],
    );
  }
}
