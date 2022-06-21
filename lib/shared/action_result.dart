import 'dart:convert';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';

class ActionLogItem {
  final TransformAction type;
  final OrderedStringItem input;
  final List args;
  final int inputIndex;
  final String output;
  final int outputIndex;

  ActionLogItem(
    this.type,
    this.input,
    this.args,
    this.inputIndex,
    this.output,
    this.outputIndex,
  );
}
