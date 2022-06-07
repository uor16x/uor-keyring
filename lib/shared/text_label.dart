import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String label;
  final String text;
  final bool readOnly;
  final String hint;

  const TextLabel(this.label, this.text,
      {this.readOnly = false, this.hint = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.left,
        ),
        TextField(
          controller: TextEditingController()..text = text,
          cursorColor: Colors.white,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
          ),
        )
      ],
    );
  }
}
