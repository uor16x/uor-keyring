import 'package:uor_keyring/shared/action_result.dart';

class LogItemsCollection {
  final List<ActionLogItem> items;

  LogItemsCollection({this.items = const []});

  ActionLogItem add(
    String type,
    String input,
    List args,
    int inputIndex,
    String output,
  ) {
    ActionLogItem item = ActionLogItem(
      type,
      input,
      args,
      inputIndex,
      output,
      items.length,
    );
    items.add(item);
    return item;
  }
}
