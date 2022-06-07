import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String label;
  final String hint;
  final String initialText;
  final bool readOnly;
  final Function onChangedCallback;

  const TextLabel({
    required this.label,
    required this.hint,
    required this.initialText,
    required this.onChangedCallback,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
        TextField(
          controller: TextEditingController()..text = initialText,
          cursorColor: Colors.white,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
          ),
          onChanged: (value) {
            onChangedCallback(value);
          },
        )
      ],
    );
  }
}
