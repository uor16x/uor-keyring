import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class ConcatTransform implements Transformable {
  @override
  final OrderedStringItem input;
  @override
  late final List args;

  late final OrderedStringItem s2;
  late final String separator;

  @override
  final TransformActionType key = TransformActionType.concat;

  ConcatTransform(this.input, this.args) {
    if (args.length != 2) {
      throw ArgumentError('ConcatTransform expects 2 arguments');
    }
    if (args[0].runtimeType != OrderedStringItem) {
      throw ArgumentError(
          'ConcatTransform expects first argument(s2) to be a OrderedStringItem');
    }
    s2 = args[0];
    if (args[1].runtimeType != String) {
      throw ArgumentError(
          'ConcatTransform expects second argument(separator) to be a String');
    }
    separator = args[1];
  }

  @override
  String transform() {
    return _concat(input.value, s2.value, separator);
  }

  String _concat(String s1, String s2, [String separator = '']) {
    return s1 + separator + s2;
  }
}
