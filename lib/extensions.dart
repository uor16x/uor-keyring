import 'package:uor_keyring/shared/ordered_string_item.dart';

import 'widgets/keygen/actions/transform_action.dart';

extension AdvancedIter<T> on List<T> {
  List<E> mapWithIndex<E>(E Function(T item, int index) callback) {
    List<E> result = [];
    for (int i = 0; i < length; i++) {
      result.add(callback(this[i], i));
    }
    return result;
  }
}

typedef void ProcessActionMethod(
  TransformAction type,
  OrderedStringItem input,
  List args,
  int inputIndex,
  String output,
);
