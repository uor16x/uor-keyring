class ActionLogItem {
  final String type;
  final List args;
  final String oldValue;
  final int oldValueIndex;
  final String result;

  ActionLogItem(
    this.type,
    this.args,
    this.oldValue,
    this.oldValueIndex,
    this.result,
  );
}
