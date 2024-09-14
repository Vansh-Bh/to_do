import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/widgets/themes.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('tasks');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      home: HomePage(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}
