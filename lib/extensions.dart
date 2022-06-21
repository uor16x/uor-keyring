import 'package:uor_keyring/shared/ordered_string_item.dart';

import 'widgets/keygen/actions/transform_action.dart';

extension AdvancedIter<T> on List<T> {
  List<V> mapWithIndex<V>(V Function(T item, int index) callback) {
    List<V> result = [];
    for (int i = 0; i < length; i++) {
      result.add(callback(this[i], i));
    }
    return result;
  }

  bool everyWithIndex(bool Function(T item, int index) callback) {
    bool result = true;
    for (int i = 0; i < length; i++) {
      if (!callback(this[i], i)) {
        result = false;
        break;
      }
    }
    return result;
  }
}

typedef ProcessActionMethod = void Function(
  TransformAction type,
  OrderedStringItem input,
  List args,
  int inputIndex,
  String output,
);
