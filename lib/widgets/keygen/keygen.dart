import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/shared/generator.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
import 'package:uor_keyring/shared/ordered_string_item.dart';
import 'package:uor_keyring/transform/none.dart';
import 'package:uor_keyring/transform/transform.dart';
import 'package:uor_keyring/widgets/keygen/blocks/log_block.dart';
import 'package:uor_keyring/widgets/keygen/blocks/result_block.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';
import 'package:uor_keyring/widgets/shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
  late String lastResultText;
  late LogItemsCollection log;

  void reset({initial = false}) {
    const String initialResultText = 'my-email-1';
    lastResultText = initialResultText;
    log = LogItemsCollection();
    log.add(
      NoneTransform(initialResultText),
      OrderedStringItem(0, '-'),
      [],
      0,
      initialResultText,
    );
    if (!initial) {
      setState(() {
        lastResultText = lastResultText;
        log = log;
      });
    }
  }

  _KeyGenState() {
    reset(initial: true);
  }

  void addAction(
    Transformable type,
    OrderedStringItem input,
    List args,
    int inputIndex,
    String output,
  ) {
    setState(() {
      ActionLogItem newItem = log.add(
        type,
        input,
        args,
        inputIndex,
        output,
      );
      log = log;
      lastResultText = newItem.output;
    });
  }

  void copyResultText() {
    String key = Generator.getKey(log);
    LogItemsCollection result = Generator.applyKey('HELLO-WORLD', key);
    print('');
  }

  void copyResultKey() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const TabHeader("Generate new key"),
          Styles.emptySpace(15),
          ResultBlock(
            result: lastResultText,
            copy: copyResultText,
          ),
          Styles.emptySpace(15),
          Expanded(
            child: LogBlock(
              currentValue: lastResultText,
              logItems: log.items,
              newActionApplied: addAction,
              reset: reset,
            ),
          ),
        ],
      ),
    );
  }
}
