import 'package:uor_keyring/transform/transform.dart';

class AttachTransform implements Transformable {
  final String input;
  late final String attachment;
  late final bool after;

  static const key = 'attach';

  AttachTransform(this.input, List args) {
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
    return _attach(input, attachment, after);
  }

  String _attach(String input, String attachment, bool after) {
    return after ? '$input$attachment' : '$attachment$input';
  }
}
