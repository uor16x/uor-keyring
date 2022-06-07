import 'package:flutter/material.dart';
import 'package:uor_keyring/widget/keygen/actions/substr.dart';

class ActionPicker extends StatefulWidget {
  final Function success;

  const ActionPicker({required this.success, super.key});

  @override
  State<ActionPicker> createState() => _ActionPickerState();
}

class _ActionPickerState extends State<ActionPicker> {
  String _value = 'One';

  void setAction(String? newValue) {
    setState(() {
      _value = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Text labelText = const Text(
      'Action',
      style: TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.left,
    );

    DropdownButton<String> dropdown = DropdownButton<String>(
      isExpanded: true,
      value: _value,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white30,
      ),
      onChanged: setAction,
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          labelText,
          dropdown,
          const SizedBox(height: 10),
          if (_value == 'Two') Substr(onTransform: widget.success),
        ],
      ),
    );
  }
}