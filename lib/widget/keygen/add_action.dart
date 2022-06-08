import 'package:flutter/material.dart';
import 'package:uor_keyring/widget/keygen/actions/list.dart';

class AddAction extends StatefulWidget {
  final Function apply;

  const AddAction({super.key, required this.apply});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  String value = TransformAction.none as String;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('this is add action widget'),
    );
  }
}
