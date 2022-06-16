import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';

class SelectInput extends StatefulWidget {
  final List<ActionLogItem> inputs;
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
            value: OrderedStringItem(index, item.output),
            child: Text(
              '#${item.outputIndex}: ${item.output}',
              overflow: TextOverflow.ellipsis,
            ),
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
