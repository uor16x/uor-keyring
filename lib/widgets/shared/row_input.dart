import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uor_keyring/widgets/shared/styles.dart';

class RowInput extends StatelessWidget {
  final String label;
  void Function(String result) onChanged;

  RowInput({required this.label, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: TextField(
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: 'insert "$label" here',
            ),
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
          ),
        )
      ],
    );
  }
}
