import 'package:flutter/material.dart';
import 'package:uor_keyring/service/transform/substr.dart';

class Substr extends StatelessWidget {
  const Substr({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white30,
      ),
      onPressed: () {
        String a = substr('zxczxc', 0, 1);
        print(a);
      },
      child: const Text(
        'PRESS',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
