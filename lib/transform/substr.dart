import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class SubstrTransform implements Transformable {
  @override
  final OrderedStringItem input;
  @override
  late final List args;

  late final int from;
  late final int to;

  @override
  final TransformActionType key = TransformActionType.substr;

  SubstrTransform(this.input, this.args) {
    if (args.length != 2) {
      throw ArgumentError('SubstrTransform expects 2 arguments');
    }
    if (args[0].runtimeType != int) {
      throw ArgumentError(
          'SubstrTransform expects first argument(from) to be a string');
    }
    from = args[0];
    if (args[1].runtimeType != int) {
      throw ArgumentError(
          'SubstrTransform expects second argument(to) to be a bool');
    }
    to = args[1];
  }

  @override
  String transform() {
    return _substr(input.value, from, to);
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
