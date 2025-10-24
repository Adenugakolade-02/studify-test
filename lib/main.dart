import 'package:flutter/material.dart';
import 'package:studify/app/presentation/pages/Home/home_screen.dart';
import 'package:studify/app/presentation/pages/home/text_summary_screen.dart';
import 'package:studify/app/presentation/pages/quiz/active_quiz_screen.dart';
import 'package:studify/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: ActiveQuizScreen(),
    );
  }
}
