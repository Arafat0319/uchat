import 'package:flutter/material.dart';
import 'package:uchat/theme.dart';
import 'package:uchat/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // 构造器
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
        title: 'Chatter',
        home: HomeScreen());
  }
}
