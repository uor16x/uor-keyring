import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _LogItem extends StatelessWidget {
  final ActionLogItem item;
  final int index;
  static const TextStyle textStyle = TextStyle(
    fontSize: 20,
  );

  const _LogItem({required this.item, required this.index});

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
            '#${index + 1}',
            style: textStyle,
          ),
          Text(
            item.result,
            style: textStyle,
          ),
          Text(
            '#${item.oldValueIndex} >> {${item.type}}',
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
  final void Function(ActionLogItem item) newActionApplied;
  final void Function() reset;

  const LogBlock({
    super.key,
    required this.currentValue,
    required this.logItems,
    required this.newActionApplied,
    required this.reset,
  });

  List<String> getInputs() {
    return logItems.map((item) => item.result).toList();
  }

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
            inputs: getInputs(),
            apply: newActionApplied,
            reset: reset,
          ),
          Styles.emptySpace(10),
          ...logItems
              .mapWithIndex(
                (item, index) => _LogItem(
                  item: item,
                  index: index,
                ),
              )
              .where((logItem) =>
                  logItem.item.type != TransformAction.none.asString())
        ],
      ),
    );
  }
}
