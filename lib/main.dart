import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
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

  static const Color mainColor = Color.fromARGB(128, 40, 47, 56);
  static const Color mainOverlappingColor = Color.fromRGBO(30, 35, 42, 1);
  static const Color secondaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uor Keyring',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        cardColor: mainColor,
        canvasColor: mainOverlappingColor,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: mainOverlappingColor,
        ),
        indicatorColor: secondaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(top: 12, bottom: 12),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: secondaryColor, width: 1.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(mainColor),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: mainColor,
        ),
        scaffoldBackgroundColor: mainColor,
      ),
      home: const Home(),
    );
  }
}
