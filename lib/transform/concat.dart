import 'package:uor_keyring/transform/transform.dart';

class ConcatTransform implements Transformable {
  final String input;
  late final String s2;
  late final String separator;

  static const key = 'concat';

  ConcatTransform(this.input, List args) {
    if (args.length != 2) {
      throw ArgumentError('AttachTransform expects 2 arguments');
    }
    if (args[0].runtimeType != String) {
      throw ArgumentError(
          'AttachTransform expects first argument(s2) to be a string');
    }
    s2 = args[0];
    if (args[1].runtimeType != bool) {
      throw ArgumentError(
          'AttachTransform expects second argument(separator) to be a bool');
    }
    separator = args[1];
  }

  @override
  String transform() {
    return _concat(input, s2, separator);
  }

  String _concat(String s1, String s2, [String separator = '']) {
    return s1 + separator + s2;
  }
}
