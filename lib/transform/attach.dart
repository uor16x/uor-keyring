import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class AttachTransform implements Transformable {
  @override
  final OrderedStringItem input;
  @override
  late final List args;

  late final String attachment;
  late final bool after;

  @override
  final TransformActionType key = TransformActionType.attach;

  AttachTransform(this.input, this.args) {
    if (args.length != 2) {
      throw ArgumentError('AttachTransform expects 2 arguments');
    }
    if (args[0].runtimeType != String) {
      throw ArgumentError(
          'AttachTransform expects first argument(attachment) to be a string');
    }
    attachment = args[0];
    if (args[1].runtimeType != bool) {
      throw ArgumentError(
          'AttachTransform expects second argument(after) to be a bool');
    }
    after = args[1];
  }

  @override
  String transform() {
    return _attach(input.value, attachment, after);
  }

  String _attach(String input, String attachment, bool after) {
    return after ? '$input$attachment' : '$attachment$input';
  }
}
