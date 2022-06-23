import 'package:uor_keyring/transform/transform.dart';

class SubstrTransform implements Transformable {
  final String input;
  late final int from;
  late final int to;

  @override
  final TransformActionType key = TransformActionType.substr;

  SubstrTransform(this.input, List args) {
    if (args.length != 2) {
      throw ArgumentError('AttachTransform expects 2 arguments');
    }
    if (args[0].runtimeType != int) {
      throw ArgumentError(
          'AttachTransform expects first argument(s2) to be a string');
    }
    from = args[0];
    if (args[1].runtimeType != int) {
      throw ArgumentError(
          'AttachTransform expects second argument(separator) to be a bool');
    }
    to = args[1];
  }

  @override
  String transform() {
    return _substr(input, from, to);
  }

  String _substr(String input, int from, int to) {
    if (input.isEmpty) {
      throw Exception('Input is empty');
    }
    if (to < from) {
      // if to is less than from - swap them
      int oldFrom = from;
      from = to;
      to = oldFrom;
    }
    if (to > input.length - 1) {
      // if to is bigger than length - repeat the input until its possible to take the range
      int timesRepeated = (to / input.length).floor() + 1;
      input = List.filled(timesRepeated, input).join();
    }

    return input.substring(from, to);
  }
}
