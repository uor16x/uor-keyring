import 'package:flutter/material.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _ResultText extends StatelessWidget {
  final String label;
  final String text;
  final String button;
  final Function onPress;

  const _ResultText({
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
        Styles.emptySpace(),
        Text(
          text,
          style: const TextStyle(fontSize: 21),
          textAlign: TextAlign.left,
        ),
        Styles.emptySpace(),
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

class ResultBlock extends StatelessWidget {
  final String result;
  final Function copy;

  const ResultBlock({
    super.key,
    required this.result,
    required this.copy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.padding(),
      decoration: Styles.boxDecoration,
      child: _ResultText(
        label: 'Last result',
        text: result,
        button: 'Copy key',
        onPress: copy,
      ),
    );
  }
}
