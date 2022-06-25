import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:uor_keyring/theme.dart';
import 'widgets/home.dart';

Future testWindowFunctions() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.windows && !kIsWeb) {
    double width = 550;
    double height = 650;
    await DesktopWindow.setMinWindowSize(Size(width, height));
    await DesktopWindow.setMaxWindowSize(Size(width, height));
  }
}

Future<void> main() async {
  await testWindowFunctions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uor Keyring',
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const Home(),
    );
  }
}
