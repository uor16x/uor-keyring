import 'package:flutter/material.dart';
import 'package:uor_keyring/service/transform/substr.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/toast.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';

class Substr extends StatelessWidget {
  final String currentValue;
  final void Function(ActionLogItem item) onTransform;

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
          onTransform(ActionLogItem(
            TransformAction.substr.asString(),
            [1, 5],
            currentValue,
            result,
          ));
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
