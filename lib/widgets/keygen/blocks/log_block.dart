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
    return InkWell(
      onTap: () {}, // Handle your callback
      child: Container(
        // margin: const EdgeInsets.only(
        //   bottom: 10,
        // ),
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
            Styles.emptySpace(),
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
            Styles.emptySpace(),
            // Expanded(
            //   flex: 3,
            //   child: Container(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       '#${item.inputIndex} ⇒ ${item.type.asString()} ${item.args}',
            //       style: textStyle,
            //       overflow: TextOverflow.fade,
            //     ),
            //   ),
            // ),
          ],
        ),
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
            ? AddAction(
                inputs: logItems,
                apply: newActionApplied,
                reset: reset,
              )
            : Card(child: items[index - 1]);
      },
    );
    // return Container(
    //   // padding: Styles.padding(),
    //   decoration: Styles.boxDecoration,
    //   child: ListView.separated(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //     padding: const EdgeInsets.all(10),
    //     itemBuilder: itemBuilder,
    //     children: <Widget>[
    //       AddAction(
    //         inputs: logItems,
    //         apply: newActionApplied,
    //         reset: reset,
    //       ),
    //       Styles.emptySpace(10),
    //       // items
    //     ],
    //   ),
    // );
  }
}
