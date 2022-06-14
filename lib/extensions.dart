extension AdvancedIter<T> on List<T> {
  List<E> mapWithIndex<E>(E Function(T item, int index) callback) {
    List<E> result = [];
    for (int i = 0; i < length; i++) {
      result.add(callback(this[i], i));
    }
    return result;
  }
}
