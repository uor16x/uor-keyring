import 'package:flutter/material.dart';

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
          ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   primary: Colors.black,
            // ),
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
