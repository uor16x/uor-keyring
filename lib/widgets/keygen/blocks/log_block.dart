import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';

class _LogItem extends StatelessWidget {
  final ActionLogItem item;

  const _LogItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white54,
          ),
          shape: BoxShape.circle),
      child: Center(
        child: Text(
          '${item.type} [${item.args}]',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class LogBlock extends StatelessWidget {
  final List<ActionLogItem> logItems;
  final Function newActionApplied;

  const LogBlock(
      {super.key, required this.logItems, required this.newActionApplied});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
        ),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ...logItems.map((item) => _LogItem(item: item)),
          AddAction(apply: newActionApplied),
        ],
      ),
    );
  }
}
