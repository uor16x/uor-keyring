import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/widgets/shared/ordered_string_item.dart';

class SelectInput extends StatefulWidget {
  List<String> inputs;
  void Function(OrderedStringItem? selected) onSelect;

  SelectInput({required this.inputs, required this.onSelect, super.key});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  OrderedStringItem? selectedInput;

  void select(OrderedStringItem? value) {
    setState(() {
      selectedInput = value;
      widget.onSelect(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<OrderedStringItem>> items = widget.inputs
        .mapWithIndex<DropdownMenuItem<OrderedStringItem>>(
          (item, index) => DropdownMenuItem<OrderedStringItem>(
            value: OrderedStringItem(index, item),
            child: Text(item),
          ),
        )
        .toList();

    return DropdownButton<OrderedStringItem>(
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
