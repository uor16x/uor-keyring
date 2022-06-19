import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/keygen/actions/select_input.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

enum AttachPosition { before, after }

class _SwitchAttachPosition extends StatefulWidget {
  @override
  State<_SwitchAttachPosition> createState() => _SwitchAttachPositionState();
}

class _SwitchAttachPositionState extends State<_SwitchAttachPosition> {
  AttachPosition value = AttachPosition.after;

  void setValue(bool switchValue) {
    setState(() {
      value = switchValue ? AttachPosition.after : AttachPosition.before;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: value == AttachPosition.after, onChanged: setValue);
  }
}

class Attach extends StatefulWidget {
  final List<ActionLogItem> inputs;
  final ProcessActionMethod onTransform;

  const Attach({super.key, required this.inputs, required this.onTransform});
  @override
  State<Attach> createState() => _AttachState();
}

class _AttachState extends State<Attach> {
  OrderedStringItem? item;

  void setItem(OrderedStringItem? value) {
    setState(() {
      item = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration,
      padding: Styles.padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectInput(inputs: widget.inputs, onSelect: setItem),
          Styles.emptySpace(),
          SelectInput(inputs: widget.inputs, onSelect: setItem),
        ],
      ),
    );
  }
}
