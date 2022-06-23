import 'package:uor_keyring/transform/transform.dart';

class NoneTransform implements Transformable {
  final String output;

  @override
  final TransformActionType key = TransformActionType.none;

  NoneTransform(this.output);

  @override
  String transform() {
    return output;
  }
}
