import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _LogItem extends StatelessWidget {
  final ActionLogItem item;

  const _LogItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(5),
      decoration: Styles.boxDecoration,
      child: Center(
        child: Text(
          '${item.type} ${item.args}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class LogBlock extends StatelessWidget {
  final String currentValue;
  final List<ActionLogItem> logItems;
  final void Function(ActionLogItem item) newActionApplied;

  const LogBlock({
    super.key,
    required this.currentValue,
    required this.logItems,
    required this.newActionApplied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: Styles.boxDecoration,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ...logItems.map((item) => _LogItem(item: item)),
          AddAction(currentValue: currentValue, apply: newActionApplied),
        ],
      ),
    );
  }
}
