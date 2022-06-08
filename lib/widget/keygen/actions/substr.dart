import 'package:flutter/material.dart';
import 'package:uor_keyring/service/transform/substr.dart';
import 'package:uor_keyring/shared/toast.dart';

class Substr extends StatelessWidget {
  final String currentValue;
  final Function onTransform;

  const Substr(
      {required this.currentValue, required this.onTransform, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white30,
      ),
      onPressed: () {
        try {
          String result = substr(currentValue, 1, 5);
          onTransform(result);
        } catch (err) {
          errToast('Failed to execute action: $err');
        }
      },
      child: const Text(
        'Cut',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
