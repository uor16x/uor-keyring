import 'package:uor_keyring/shared/ordered_string_item.dart';

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
  String transform();
}
