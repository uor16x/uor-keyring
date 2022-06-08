import 'package:flutter/material.dart';
import 'package:uor_keyring/widget/keygen/actions/list.dart';

class AddAction extends StatefulWidget {
  final Function apply;

  const AddAction({super.key, required this.apply});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  bool addMode = false;
  String value = TransformAction.none.asString();

  @override
  Widget build(BuildContext context) {
    var z = addMode
        ? Center(
            child: Column(
              children: [
                const Text('FIELD 1'),
                const Text('FIELD 2'),
                TextButton(
                    onPressed: () {
                      setState(() {
                        addMode = false;
                      });
                      widget.apply();
                    },
                    child: const Text('TRANSFORM')),
                TextButton(
                  onPressed: () {
                    setState(() {
                      addMode = false;
                    });
                  },
                  child: const Text('CANCEL'),
                ),
              ],
            ),
          )
        : Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  addMode = true;
                });
              },
              child: const Text('ADD ACTION'),
            ),
          );

    return z;
  }
}
