enum TransformAction {
  none,
  substr,
  concat,
  attach,
}

extension ParseToString on TransformAction {
  String asString() {
    return toString().split('.').last;
  }
}
