import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/generator.dart';
import 'package:uor_keyring/shared/log_items_collection.dart';
import 'package:uor_keyring/transform/none.dart';
import 'package:uor_keyring/transform/transform.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
import 'package:uor_keyring/widgets/keygen/blocks/log_block.dart';
import 'package:uor_keyring/theme.dart';
import 'package:uor_keyring/widgets/shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
  late LogItemsCollection log;

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

  void addAction(BuildContext context, Transformable action) {
    Navigator.of(context).pop(); // close modal
    setState(() {
      log.add(action);
      log = log;
    });
  }

  void copyResultText() {
    String key = Generator.getKey(log);
  }

  void showAddActionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddAction(
        inputs: log.items,
        apply: (Transformable action) => addAction(context, action),
        onCancel: () => {},
      ),
    );
  }

  void copyResultKey() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    if (log.items.length > 1) {
      buttons.add(
        FloatingActionButton(
          onPressed: () => showAddActionModal(context),
          child: const Icon(Icons.restart_alt),
        ),
      );
    }
    buttons.add(const SizedBox(height: 15));
    buttons.add(
      FloatingActionButton(
        onPressed: () => showAddActionModal(context),
        child: const Icon(Icons.post_add),
      ),
    );

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
            Expanded(child: LogBlock(log.items)),
          ],
        ),
      ),
    );
  }
}
