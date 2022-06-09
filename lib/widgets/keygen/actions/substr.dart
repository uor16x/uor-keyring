import 'package:flutter/material.dart';
import 'package:uor_keyring/service/transform/substr.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/toast.dart';
import 'package:uor_keyring/widgets/keygen/actions/select_input.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class Substr extends StatefulWidget {
  final List<String> inputs;
  final void Function(ActionLogItem item) onTransform;

  const Substr({super.key, required this.inputs, required this.onTransform});

  @override
  State<Substr> createState() => _SubstrState();
}

class _SubstrState extends State<Substr> {
  String? selectedValue;

  void setValue(String? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> valueSelectedWidgets = <Widget>[
      Row(
        children: [],
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white30,
        ),
        onPressed: () {
          try {
            String result = substr(selectedValue!, 1, 5);
            widget.onTransform(
              ActionLogItem(
                TransformAction.substr.asString(),
                [1, 5],
                selectedValue!,
                result,
              ),
            );
          } catch (err) {
            errToast('Failed to execute action: $err');
          }
        },
        child: const Text(
          'Cut',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ];

    return Container(
      decoration: Styles.boxDecoration,
      padding: Styles.padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectInput(inputs: widget.inputs, onSelect: setValue),
          Styles.emptySpace(),
          if (selectedValue != null) ...valueSelectedWidgets
        ],
      ),
    );
  }
}
