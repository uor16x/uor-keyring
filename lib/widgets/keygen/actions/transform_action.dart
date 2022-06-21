import 'package:uor_keyring/extensions.dart';

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

class TransformActionProcessor {
  static const Map<TransformAction, List<Type>> _actionInputsTypes = {
    TransformAction.none: [],
    TransformAction.substr: [String, int, int],
    TransformAction.concat: [String, String, String],
    TransformAction.attach: [String, String, String],
  };

  static bool isValid(TransformAction type, List input) {
    if (!_actionInputsTypes.containsKey(type)) {
      return false;
    }
    List<Type> currentActionInputTypes = _actionInputsTypes[type]!;
    return currentActionInputTypes.everyWithIndex(
      (actionType, index) => actionType == input[index].runtimeType,
    );
  }
}
