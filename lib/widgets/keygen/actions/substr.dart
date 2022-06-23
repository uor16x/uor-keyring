import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/transform/substr.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/transform/transform.dart';
import 'package:uor_keyring/widgets/keygen/actions/select_input.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/shared/row_input.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class Substr extends StatefulWidget {
  final List<ActionLogItem> inputs;
  final ProcessActionMethod onTransform;

  const Substr({super.key, required this.inputs, required this.onTransform});

  @override
  State<Substr> createState() => _SubstrState();
}

class _SubstrArgInputs extends StatelessWidget {
  void Function(String value) setFrom;
  void Function(String value) setTo;

  _SubstrArgInputs({required this.setFrom, required this.setTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0,
        right: 10,
        bottom: 10,
        left: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: RowInput(label: 'from', onChanged: setFrom)),
          const SizedBox(width: 10),
          Flexible(child: RowInput(label: 'to', onChanged: setTo))
        ],
      ),
    );
  }
}

class _SubstrTransformButton extends StatelessWidget {
  Function()? onClick;

  _SubstrTransformButton({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white30,
      ),
      onPressed: onClick,
      onLongPress: null,
      child: const Text(
        'Cut',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class _SubstrState extends State<Substr> {
  OrderedStringItem? selectedValue;
  int? from;
  int? to;

  void setValue(OrderedStringItem? value) {
    setState(() {
      selectedValue = value;
    });
  }

  void setFrom(String value) {
    setState(() {
      from = int.tryParse(value);
    });
  }

  void setTo(String value) {
    setState(() {
      to = int.tryParse(value);
    });
  }

  Function()? getTransformCallback() {
    return from != null && to != null ? transform : null;
  }

  void transform() {
    try {
      List args = [from!, to!];
      Transformable action = SubstrTransform(selectedValue!, args);
      widget.onTransform(action);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> valueSelectedWidgets = <Widget>[
      _SubstrArgInputs(setFrom: setFrom, setTo: setTo),
      _SubstrTransformButton(onClick: getTransformCallback()),
    ];

    return Container(
      decoration: Styles.boxDecoration,
      padding: Styles.padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectInput(inputs: widget.inputs, onSelect: setValue),
          Styles.emptySpace(),
          if (selectedValue != null) ...valueSelectedWidgets
        ],
      ),
    );
  }
}
