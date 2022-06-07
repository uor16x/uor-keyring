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
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          labelText,
          dropdown,
          const SizedBox(height: 10),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          if (_value == 'Two') Substr(onTransform: widget.success),
          // Container(
          //   height: 50,
          //   color: Colors.amber[600],
          //   child: const Center(child: Text('Entry A')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[500],
          //   child: const Center(child: Text('Entry B')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: const Center(child: Text('Entry C')),
          // ),
        ],
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       labelText,
      //       dropdown,
      //       const SizedBox(height: 10),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //       if (_value == 'Two') Substr(onTransform: widget.success),
      //     ],
      //   ),
      // ),
    );
  }
}
