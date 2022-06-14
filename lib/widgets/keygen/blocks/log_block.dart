import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _LogItem extends StatelessWidget {
  final ActionLogItem item;
  static const TextStyle textStyle = TextStyle(
    fontSize: 20,
  );

  const _LogItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: Styles.padding(5),
      decoration: Styles.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '#${item.outputIndex}',
            style: textStyle,
          ),
          Text(
            item.output,
            style: textStyle,
          ),
          Text(
            '#${item.inputIndex} ⇒ ${item.type.asString()} ${item.args}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class LogBlock extends StatelessWidget {
  final String currentValue;
  final List<ActionLogItem> logItems;
  final void Function(
    TransformAction type,
    String input,
    List args,
    int inputIndex,
    String output,
  ) newActionApplied;
  final void Function() reset;

  const LogBlock({
    super.key,
    required this.currentValue,
    required this.logItems,
    required this.newActionApplied,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: Styles.padding(),
      decoration: Styles.boxDecoration,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          AddAction(
            inputs: logItems,
            apply: newActionApplied,
            reset: reset,
          ),
          Styles.emptySpace(10),
          ...logItems
              .map((item) => _LogItem(item))
              .where((element) => element.item.type != TransformAction.none),
        ],
      ),
    );
  }
}
