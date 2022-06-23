import 'dart:convert';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/substr.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';

class Generator {
  static const String _itemSeparator = ';-;';
  static const String _argSeparator = '>';
  static const String _blockSeparator = '|';

  static String getKey(LogItemsCollection log) {
    return log.items
        .where((item) => item.type != TransformAction.none)
        .map((item) => encodeItem(item))
        .join(_itemSeparator);
  }

  static String _toBase64(String str) {
    List<int> bytes = utf8.encode(str);
    return base64.encode(bytes);
  }

  static String encodeItem(ActionLogItem item) {
    String stringArgs = item.args
        .map((arg) {
          if (arg is OrderedStringItem) {
            return 'osi_${arg.index}';
          }
          if (arg is int) {
            return 'i_$arg';
          }
          return 's_${_toBase64(arg)}';
        })
        .toList()
        .join(_argSeparator);
    return [
      item.outputIndex,
      item.type.index,
      item.inputIndex,
      stringArgs,
    ].join(_blockSeparator);
  }

  static LogItemsCollection applyKey(String input, String key) {
    LogItemsCollection log = LogItemsCollection();
    log.add(
      TransformAction.none,
      OrderedStringItem(0, '-'),
      [],
      0,
      input,
    );
    key.split(_itemSeparator).forEach((item) {
      print(item);
      // TODO: transform item
      // log.add(type, input, args, inputIndex, output)
    });
    return log;
  }
}
