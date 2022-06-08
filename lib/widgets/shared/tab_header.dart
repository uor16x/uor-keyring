import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  final String title;

  const TabHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
