import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';

class Attach extends StatefulWidget {
  final List<ActionLogItem> inputs;
  final ProcessActionMethod onTransform;

  const Attach({super.key, required this.inputs, required this.onTransform});
  @override
  State<Attach> createState() => _AttachState();
}

class _AttachState extends State<Attach> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
