import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/home_widget.dart';
import 'package:ohms_law/home_widgets/menu_actions.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OhmModel() ,
      child: MaterialApp(
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
            actions: const <Widget>[
              MenuActions()
            ],
            backgroundColor: Colors.red,
          ),
          body: const HomeWidget()
        ),
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
