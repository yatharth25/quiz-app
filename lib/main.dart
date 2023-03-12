import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_entry.dart';
import 'package:quiz/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: AppColor.black),
        unselectedWidgetColor: AppColor.black48,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColor.white,
            titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.black)),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColor.royalBlue),
      ),
      home: const QuizEntry(),
    );
  }
}
