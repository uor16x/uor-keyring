import 'package:flutter/material.dart';
import 'package:uor_keyring/extensions.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/keygen/blocks/add_action.dart';
import 'package:uor_keyring/widgets/keygen/blocks/item_info.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _LogItem extends StatelessWidget {
  final ActionLogItem item;
  static const TextStyle textStyle = TextStyle(
    fontSize: 20,
  );

  const _LogItem(this.item);

  showInfo(BuildContext context) {
    _LogItem logItem = context.widget as _LogItem;
    showModalBottomSheet(
      context: context,
      builder: (context) => ItemInfo(logItem.item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showInfo(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: Styles.boxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  '#${item.outputIndex}',
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.output,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogBlock extends StatelessWidget {
  final String currentValue;
  final List<ActionLogItem> logItems;
  final ProcessActionMethod newActionApplied;
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
    List<_LogItem> items = logItems
        .map((item) => _LogItem(item))
        .where((element) => element.item.type != TransformAction.none)
        .toList();
    return ListView.builder(
      padding: Styles.padding(),
      itemCount: items.length + 1,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return index == 0
            ? Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: AddAction(
                  inputs: logItems,
                  apply: newActionApplied,
                  reset: reset,
                ),
              )
            : Card(child: items[index - 1]);
      },
    );
  }
}
