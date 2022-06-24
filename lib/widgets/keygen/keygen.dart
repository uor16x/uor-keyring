import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/generator.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
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

  void copyResultKey() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: toggleAddAction,
        child: showAddAction
            ? const Icon(Icons.close)
            : const Icon(Icons.post_add),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TabHeader("Generate new key"),
            Styles.emptySpace(15),
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
