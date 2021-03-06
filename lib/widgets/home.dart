import 'package:flutter/material.dart';
import 'package:uor_keyring/widgets/keygen/keygen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Uor Keyring'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.lock_open),
              ),
              Tab(
                icon: Icon(Icons.password),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Decode password"),
            ),
            Keygen(),
          ],
        ),
      ),
    );
  }
}
