import 'dart:convert';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/none.dart';
import 'package:uor_keyring/transform/transform.dart';

class Generator {
  static const String _itemSeparator = ';-;';
  static const String _argSeparator = '>';
  static const String _blockSeparator = '|';

  static String getKey(LogItemsCollection log) {
    return log.items
        .where((item) => item.action.key != TransformActionType.none)
        .map((item) => encodeItem(item))
        .join(_itemSeparator);
  }

  static String _toBase64(String str) {
    List<int> bytes = utf8.encode(str);
    return base64.encode(bytes);
  }

  static String _fromBase64(String b64str) {
    List<int> bytes = base64.decode(b64str);
    return utf8.decode(bytes);
  }

  static String encodeItem(ActionLogItem item) {
    String stringArgs = item.action.args
        .map((arg) {
          if (arg is OrderedStringItem) {
            return 'osi_${arg.index}';
          }
          if (arg is int) {
            return 'i_$arg';
          }
          if (arg is bool) {
            return 'b_$arg';
          }
          return 's_${_toBase64(arg)}';
        })
        .toList()
        .join(_argSeparator);
    return [
      item.action.input.index,
      item.action.key.index,
      stringArgs,
    ].join(_blockSeparator);
  }

  static Transformable? _decodeItem(String item, LogItemsCollection log) {
    List<String> blocks = item.split(_blockSeparator);
    Transformable? result;
    try {
      int inputIndex = int.parse(blocks[0]);

      ActionLogItem? inputLogItem = log.getByOutputIndex(inputIndex);
      if (inputLogItem == null) {
        throw Exception('Input index $inputIndex not found');
      }
      OrderedStringItem input = OrderedStringItem(
        inputLogItem.outputIndex,
        inputLogItem.output,
      );

      int transformActionTypeIndex = int.parse(blocks[1]);
      TransformActionType type =
          TransformActionType.values[transformActionTypeIndex];
      if (!Transformable.keyTypes.containsKey(type)) {
        throw Exception('Unknown transform action type: $type');
      }

      List args = blocks[2].split(_argSeparator).map(
        (arg) {
          if (arg.startsWith('osi_')) {
            int index = int.parse(arg.substring(4));
            ActionLogItem? argInput = log.getByOutputIndex(index);
            if (argInput == null) {
              throw Exception('Input index $inputIndex not found');
            }
            return OrderedStringItem(
              argInput.outputIndex,
              argInput.output,
            );
          }
          if (arg.startsWith('i_')) {
            return int.parse(arg.substring(2));
          }
          if (arg.startsWith('b_')) {
            return arg.substring(2).toLowerCase() == 'true';
          }
          if (arg.startsWith('s_')) {
            return _fromBase64(arg.substring(2));
          }
        },
      ).toList();

      result = Transformable.keyTypes[type]!(input, args);
    } catch (err) {
      print(err);
    }
    return result;
  }

  static LogItemsCollection applyKey(String input, String key) {
    LogItemsCollection log = LogItemsCollection();
    log.add(NoneTransform(input));
    if (key.isNotEmpty) {
      key.split(_itemSeparator).forEach((item) {
        Transformable? decoded = _decodeItem(item, log);
        if (decoded == null) {
          throw Exception('Failed to decode item: $item');
        }
        log.add(decoded);
      });
    }
    return log;
  }
}
