import 'package:flutter/material.dart';
import 'package:uor_keyring/keygen/gen_result.dart';
import 'package:uor_keyring/shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
  String _resultText = 'my-email-1';
  String _resultKey = '';

  void setResultText(String newResultText) {
    setState(() {
      _resultText = newResultText;
    });
  }

  void setResultKey(String newResultKey) {
    setState(() {
      _resultKey = newResultKey;
    });
  }

  void copyResultText() {}

  void copyResultKey() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Scaffold(
        body: Column(
          children: [
            const TabHeader("Generate new key"),
            const SizedBox(height: 15),
            GenResult(
              resultText: _resultText,
              resultKey: _resultKey,
              copyText: copyResultText,
              copyKey: copyResultKey,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}