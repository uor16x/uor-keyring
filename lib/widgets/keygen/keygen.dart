import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/blocks/log_block.dart';
import 'package:uor_keyring/widgets/keygen/blocks/result_block.dart';
import 'package:uor_keyring/widgets/shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
  String resultText = 'my-email-1';
  List<ActionLogItem> log = [];

  void setResultText(String newResultText) {
    print('SET RESULT TEXT $newResultText');
    setState(() {
      resultText = newResultText;
    });
  }

  void addAction(ActionLogItem item) {
    setState(() {
      log.add(item);
    });
  }

  void copyResultText() {}

  void copyResultKey() {}

  void showHistory(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: const <Widget>[
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
              Text("Hello1"),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          const TabHeader("Generate new key"),
          const SizedBox(height: 15),
          ResultBlock(
            result: resultText,
            copy: copyResultText,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: LogBlock(
              currentValue: resultText,
              logItems: log,
              newActionApplied: addAction,
            ),
          ),
        ],
      ),
    );
  }
}
