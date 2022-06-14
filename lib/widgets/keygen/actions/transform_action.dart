enum TransformAction {
  none,
  substr,
  concat,
}

extension ParseToString on TransformAction {
  String asString() {
    return toString().split('.').last;
  }
}
