import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class NoneTransform implements Transformable {
  @override
  final OrderedStringItem input;
  @override
  late final List args = [];

  @override
  final TransformActionType key = TransformActionType.none;

  NoneTransform(this.input);

  @override
  String transform() {
    return input.value;
  }
}
