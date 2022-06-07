import 'package:flutter/material.dart';
import '../shared/text_label.dart';
import '../shared/tab_header.dart';

class Keygen extends StatefulWidget {
  const Keygen({super.key});

  @override
  State<Keygen> createState() => _KeyGenState();
}

class _KeyGenState extends State<Keygen> {
  String _result = 'my-email-1';

  void setResult(String newResult) {
    setState(() {
      _result = newResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Scaffold(
        body: Column(
          children: [
            const TabHeader("Generate new key"),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white54,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextLabel(
                    hint: "result",
                    initialText: _result,
                    label: "Encoded result",
                    readOnly: true,
                    onChangedCallback: setResult,
                  ),
                  Center(
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   primary: Colors.black,
                      // ),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
