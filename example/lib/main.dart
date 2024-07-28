import 'package:example/view/view_ui_tools.dart';
import 'package:flutter/material.dart';
import 'package:ui_utils_helper/ui_utils_helper.dart';

///create a global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  ///assign the navigator key to the Utils class navigator key
  ///this is to enable the toast manager to show toast messages
  Utils.navigatorKey = navigatorKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewUiTools(),
      navigatorKey: navigatorKey,
    );
  }
}
