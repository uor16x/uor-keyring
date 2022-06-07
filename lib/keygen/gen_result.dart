import 'package:flutter/material.dart';

class _ResultItem extends StatelessWidget {
  final String label;
  final String text;
  final String button;
  final Function onPress;

  const _ResultItem({
    required this.label,
    required this.text,
    required this.button,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.left,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 21),
          textAlign: TextAlign.left,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white30,
          ),
          onPressed: () {
            onPress();
          },
          child: Text(
            button,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

class GenResult extends StatelessWidget {
  final String resultText;
  final String resultKey;
  final Function copyText;
  final Function copyKey;

  const GenResult(
      {super.key,
      required this.resultText,
      required this.resultKey,
      required this.copyText,
      required this.copyKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Encoded result',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
          const Text(
            'Encoded result',
            style: TextStyle(
              fontSize: 21,
            ),
            textAlign: TextAlign.left,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white30,
            ),
            onPressed: () {},
            child: const Text(
              'Copy',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
