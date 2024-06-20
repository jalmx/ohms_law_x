import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/home_widget.dart';
import 'package:ohms_law/home_widgets/menu_actions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ohms Law X',
      theme: getThemeData(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Ohms Law X",
            style: TextStyle(color: Colors.white),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: <Widget>[
            const MenuActions()
          ],
          backgroundColor: Colors.red,
        ),
        body: const HomeWidget(),
      ),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      useMaterial3: true,
    );
  }
}
