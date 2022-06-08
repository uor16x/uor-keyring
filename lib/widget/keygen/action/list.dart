enum TransformAction {
  none,
  substr,
}

extension ParseToString on TransformAction {
  String asString() {
    return this.toString().split('.').last;
  }
}
