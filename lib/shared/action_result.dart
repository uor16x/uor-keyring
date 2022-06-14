class ActionLogItem {
  final String type;
  final String input;
  final List args;
  final int inputIndex;
  final String output;
  final int outputIndex;

  ActionLogItem(
    this.type,
    this.input,
    this.args,
    this.inputIndex,
    this.output,
    this.outputIndex,
  );
}
