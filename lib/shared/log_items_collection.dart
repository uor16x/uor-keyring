import 'package:collection/collection.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/transform/transform.dart';

class LogItemsCollection {
  final List<ActionLogItem> items = [];

  LogItemsCollection();

  ActionLogItem add(Transformable type) {
    ActionLogItem item = ActionLogItem(
      type,
      items.length,
    );
    items.add(item);
    return item;
  }

  ActionLogItem? getByOutputIndex(int index) {
    return items.firstWhereOrNull((item) => item.outputIndex == index);
  }
}
