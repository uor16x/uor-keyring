import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/keygen/actions/select_input.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

enum AttachPosition { before, after }

String getAttachPositionString(AttachPosition pos) {
  return pos.toString().split('.').last;
}

// ===

class _SwitchAttachPosition extends StatefulWidget {
  void Function(AttachPosition pos) onSelect;

  _SwitchAttachPosition(this.onSelect);

  @override
  State<_SwitchAttachPosition> createState() => _SwitchAttachPositionState();
}

class _SwitchAttachPositionState extends State<_SwitchAttachPosition> {
  AttachPosition value = AttachPosition.after;

  void setValue(bool switchValue) {
    setState(() {
      value = switchValue ? AttachPosition.after : AttachPosition.before;
    });
    widget.onSelect(value);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: value == AttachPosition.after, onChanged: setValue);
  }
}

// ===

class _AttachPositionLabel extends StatelessWidget {
  final String label;

  const _AttachPositionLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerRight,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ===

class _AttachPositionSelector extends StatelessWidget {
  void Function(AttachPosition pos) onSelect;

  _AttachPositionSelector(this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _AttachPositionLabel(getAttachPositionString(AttachPosition.before)),
          Expanded(child: _SwitchAttachPosition(onSelect)),
          _AttachPositionLabel(getAttachPositionString(AttachPosition.after)),
        ],
      ),
    );
  }
}

// ===

class Attach extends StatefulWidget {
  final List<ActionLogItem> inputs;
  final ProcessActionMethod onTransform;

  const Attach({super.key, required this.inputs, required this.onTransform});
  @override
  State<Attach> createState() => _AttachState();
}

class _AttachState extends State<Attach> {
  OrderedStringItem? item;
  AttachPosition pos = AttachPosition.after;

  void setItem(OrderedStringItem? value) {
    setState(() {
      item = value;
    });
  }

  void setPosition(AttachPosition currPos) {
    setState(() {
      pos = currPos;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _AttachPositionSelector(setPosition)),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white30,
                    ),
                    onPressed: () {},
                    onLongPress: null,
                    child: const Text(
                      'Attach',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
