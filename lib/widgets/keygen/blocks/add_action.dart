import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';

class AddAction extends StatefulWidget {
  final Function apply;

  const AddAction({super.key, required this.apply});

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

  setActionType(String type) {
    setState(() {
      actionType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget actionPicker = _ActionPicker(
      selectedType: actionType,
      onPick: setActionType,
    );

    var z = addMode
        ? Center(
            child: Column(
              children: [
                actionPicker,
                TextButton(
                    onPressed: () {
                      widget.apply(
                        ActionLogItem('Substr', [1, 2, 3], 'zxc', 'qwe'),
                      );
                      setState(() {
                        addMode = false;
                      });
                    },
                    child: const Text('TRANSFORM')),
                TextButton(
                  onPressed: () {
                    setState(() {
                      addMode = false;
                    });
                  },
                  child: const Text('CANCEL'),
                ),
              ],
            ),
          )
        : Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  addMode = true;
                });
              },
              child: const Text('ADD ACTION'),
            ),
          );

    return z;
  }
}
