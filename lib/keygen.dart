import 'package:flutter/material.dart';

import 'shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
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
          children: const [
            TabHeader("Generate new key"),
          ],
        ),
      ),
    );
  }
}
