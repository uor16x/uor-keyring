import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/generator.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
import 'package:uor_keyring/transform/none.dart';
import 'package:uor_keyring/transform/transform.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
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
  late LogItemsCollection log;
  bool showAddAction = false;

  void reset({initial = false}) {
    const String initialResultText = 'my-email-1';
    log = LogItemsCollection();
    Transformable action = NoneTransform(initialResultText);
    log.add(action);
    if (!initial) {
      setState(() {
        log = log;
      });
    }
  }

  _KeyGenState() {
    reset(initial: true);
  }

  void addAction(Transformable action) {
    setState(() {
      showAddAction = false;
      log.add(action);
      log = log;
    });
  }

  void copyResultText() {
    String key = Generator.getKey(log);
  }

  void toggleAddAction() {
    setState(() {
      showAddAction = !showAddAction;
    });
  }

  void cancelAddAction() {
    setState(() {
      showAddAction = false;
    });
  }

  void copyResultKey() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    if (log.items.length > 1) {
      buttons.add(
        FloatingActionButton(
          backgroundColor: ThemeData.light().backgroundColor,
          onPressed: toggleAddAction,
          child: const Icon(Icons.restart_alt),
        ),
      );
    }
    if (!showAddAction) {
      buttons.add(const SizedBox(height: 15));
      buttons.add(
        FloatingActionButton(
          backgroundColor: ThemeData.light().backgroundColor,
          onPressed: toggleAddAction,
          child: const Icon(Icons.post_add),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: buttons,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TabHeader("Generate new key"),
            Styles.emptySpace(),
            if (showAddAction) ...[
              AddAction(
                inputs: log.items,
                apply: addAction,
                onCancel: cancelAddAction,
              ),
              Styles.emptySpace(),
            ],
            Expanded(
              child: LogBlock(
                logItems: log.items,
                newActionApplied: addAction,
                reset: reset,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
