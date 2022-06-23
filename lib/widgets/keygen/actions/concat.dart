import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/transform/concat.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/transform/transform.dart';
import 'package:uor_keyring/widgets/keygen/actions/select_input.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class Concat extends StatefulWidget {
  final List<ActionLogItem> inputs;
  final ProcessActionMethod onTransform;

  const Concat({super.key, required this.inputs, required this.onTransform});

  @override
  State<Concat> createState() => _ConcatState();
}

class _ConcatTransformButton extends StatelessWidget {
  Function()? onClick;

  _ConcatTransformButton({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white30,
      ),
      onPressed: onClick,
      onLongPress: null,
      child: const Text(
        'Concat',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class _ConcatState extends State<Concat> {
  OrderedStringItem? string1;
  OrderedStringItem? string2;
  String separator = '';

  void setString1(OrderedStringItem? value) {
    setState(() {
      string1 = value;
    });
  }

  void setString2(OrderedStringItem? value) {
    setState(() {
      string2 = value;
    });
  }

  void setSeparator(String? value) {
    setState(() {
      separator = value ?? '';
    });
  }

  Function()? getTransformCallback() {
    return string1 != null && string2 != null ? transform : null;
  }

  void transform() {
    try {
      List args = [string2, separator];
      Transformable action = ConcatTransform(
        string1!,
        args,
      );
      widget.onTransform(action);
    } catch (err) {
      // TODO: err catching
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration,
      padding: Styles.padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectInput(inputs: widget.inputs, onSelect: setString1),
          Styles.emptySpace(),
          TextField(
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'insert separator here',
            ),
            onChanged: setSeparator,
            textInputAction: TextInputAction.next,
          ),
          Styles.emptySpace(),
          SelectInput(inputs: widget.inputs, onSelect: setString2),
          Styles.emptySpace(),
          _ConcatTransformButton(onClick: getTransformCallback()),
        ],
      ),
    );
  }
}
