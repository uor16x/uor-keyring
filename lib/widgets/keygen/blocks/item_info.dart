import 'package:flutter/material.dart';
import 'package:uor_keyring/shared/action_result.dart';
import 'package:uor_keyring/widgets/keygen/actions/transform_action.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class _ItemInfoTitle extends StatelessWidget {
  final ActionLogItem item;

  const _ItemInfoTitle(this.item);

  @override
  Widget build(BuildContext context) {
    List<String> args =
        item.args.map((arg) => arg.isNotEmpty ? '>> $arg' : '').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.type.asString(),
          style: const TextStyle(fontSize: 20),
        ),
        Text('@ ${item.input}'),
        Text(args.join('\n'))
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  final ActionLogItem item;

  const ItemInfo(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.padding(),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Text(
              '#${item.outputIndex}',
              style: const TextStyle(fontSize: 20),
            ),
            title: _ItemInfoTitle(item),
            subtitle: Text(item.output),
          ),
        ],
      ),
    );
  }
}