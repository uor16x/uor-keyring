import 'package:uor_keyring/transform/transform.dart';

class ActionLogItem {
  final Transformable action;
  final int outputIndex;
  late final String output;

  ActionLogItem(
    this.action,
    this.outputIndex,
  ) {
    output = action.transform();
  }
}
