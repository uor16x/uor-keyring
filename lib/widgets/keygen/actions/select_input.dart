import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  List<String> inputs;
  void Function(String? selected) onSelect;

  SelectInput({required this.inputs, required this.onSelect, super.key});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  String? selectedInput;

  void select(String? value) {
    setState(() {
      selectedInput = value;
      widget.onSelect(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = widget.inputs
        .map(
          (item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ),
        )
        .toList();

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedInput,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white30,
      ),
      onChanged: select,
      items: items,
    );
  }
}
