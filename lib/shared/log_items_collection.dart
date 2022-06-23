import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/transform.dart';

class LogItemsCollection {
  final List<ActionLogItem> items = [];

  LogItemsCollection();

  ActionLogItem add(
    Transformable type,
    OrderedStringItem input,
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
