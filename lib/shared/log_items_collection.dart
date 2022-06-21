import 'dart:math';

import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';

class LogItemsCollection {
  final List<ActionLogItem> items = [];

  LogItemsCollection();

  ActionLogItem add(
    TransformAction type,
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

  List<ActionLogItem> findByInputIndex(int index) {
    return items.where((element) => element.inputIndex == index).toList();
  }

  bool isUsed(ActionLogItem item) {
    return items
        .where(
          (listItem) =>
              listItem.inputIndex == item.outputIndex ||
              listItem.args.any(
                (arg) =>
                    arg is OrderedStringItem && arg.index == item.outputIndex,
              ),
        )
        .toList()
        .isNotEmpty;
  }

  List<ActionLogItem> getUsedItems() {
    return items.where((item) => isUsed(item)).toList();
  }
}
