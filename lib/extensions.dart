import 'package:uor_keyring/transform/transform.dart';

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
  Transformable action,
);
