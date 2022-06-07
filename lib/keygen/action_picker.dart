import 'package:flutter/material.dart';

class ActionPicker extends StatefulWidget {
  const ActionPicker({super.key});

  @override
  State<ActionPicker> createState() => _ActionPickerState();
}

class W1 extends StatelessWidget {
  const W1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('W1');
  }
}

class W2 extends StatelessWidget {
  const W2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('W2');
  }
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
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
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
          if (_value == 'One') const W1(),
          if (_value == 'Two') const W2(),
        ],
      ),
    );
  }
}
