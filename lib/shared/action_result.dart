import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class ActionLogItem {
  final Transformable type;
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
