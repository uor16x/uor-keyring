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
  String transform();
}
