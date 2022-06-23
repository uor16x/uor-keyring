import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class NoneTransform implements Transformable {
  @override
  late OrderedStringItem input;
  @override
  late List args;

  @override
  final TransformActionType key = TransformActionType.none;

  NoneTransform(String initialInput) {
    input = OrderedStringItem(0, initialInput);
    args = [];
  }

  @override
  String transform() {
    return input.value;
  }
}
