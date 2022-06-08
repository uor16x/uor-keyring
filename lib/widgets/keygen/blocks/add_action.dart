import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/substr.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class AddAction extends StatefulWidget {
  final String currentValue;
  final void Function(ActionLogItem item) apply;

  const AddAction({super.key, required this.currentValue, required this.apply});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _ActionPicker extends StatelessWidget {
  final String selectedType;
  final Function onPick;

  const _ActionPicker({required this.selectedType, required this.onPick});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = TransformAction.values.map(
      (item) {
        return DropdownMenuItem<String>(
          value: item.asString(),
          child: Text(item.asString()),
        );
      },
    ).toList();

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedType,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white30,
      ),
      onChanged: ((value) => {onPick(value)}),
      items: items,
    );
  }
}

class _AddActionState extends State<AddAction> {
  bool addMode = false;
  String actionType = TransformAction.none.asString();

  setMode(bool newMode) {
    setState(() {
      addMode = newMode;
    });
  }

  setActionType(String type) {
    setState(() {
      actionType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget addAction;
    if (addMode) {
      Widget actionPicker = _ActionPicker(
        selectedType: actionType,
        onPick: setActionType,
      );
      addAction = Column(
        children: [
          actionPicker,
          Styles.emptySpace(10),

          // specific transformations block
          if (actionType == TransformAction.substr.asString())
            Substr(
                currentValue: widget.currentValue, onTransform: widget.apply),
          // ---

          Styles.emptySpace(10),
          TextButton(
            onPressed: () => setMode(false),
            child: const Text('Cancel'),
          ),
        ],
      );
    } else {
      addAction = TextButton(
        onPressed: () => setMode(true),
        child: const Text('Add transformation'),
      );
    }

    return Center(child: addAction);
  }
}
