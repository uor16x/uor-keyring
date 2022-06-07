import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String label;
  final String text;
  final bool active;

  const TextLabel(
    this.label,
    this.text, {
    super.key,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          'Customer Contact',
          textAlign: TextAlign.left,
        ),
        const TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Enter here',
          ),
        )
      ],
    );
    // return Center(
    //   child: Text(
    //     title,
    //     style: const TextStyle(
    //       fontSize: 28,
    //     ),
    //   ),
    // );
  }
}
