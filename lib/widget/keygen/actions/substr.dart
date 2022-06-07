import 'package:flutter/material.dart';
import 'package:uor_keyring/service/transform/substr.dart';
import 'package:uor_keyring/shared/toast.dart';

class Substr extends StatelessWidget {
  final Function onTransform;

  const Substr({required this.onTransform, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white30,
      ),
      onPressed: () {
        try {
          String r = substr('abcde', 1, 5);
          onTransform(r);
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
