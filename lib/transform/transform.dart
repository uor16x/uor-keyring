import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/attach.dart';
import 'package:uor_keyring/transform/concat.dart';
import 'package:uor_keyring/transform/none.dart';
import 'package:uor_keyring/transform/substr.dart';

enum TransformActionType {
  none,
  substr,
  concat,
  attach,
}

extension ParseToString on TransformActionType {
  String asString() {
    return toString().split('.').last;
  }
}

abstract class Transformable {
  final TransformActionType key = TransformActionType.none;
  final OrderedStringItem input = OrderedStringItem(0, '');
  final List args = [];
  static Map<TransformActionType,
      Transformable Function(OrderedStringItem input, List args)> keyTypes = {
    TransformActionType.none: (OrderedStringItem input, List args) =>
        NoneTransform(input.value),
    TransformActionType.attach: AttachTransform.new,
    TransformActionType.concat: ConcatTransform.new,
    TransformActionType.substr: SubstrTransform.new,
  };
  String transform();
}
