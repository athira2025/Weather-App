import 'package:flutter/material.dart';
import 'package:weather_api/view/main_screen.dart';
void main() {
  runApp(const MainApp());
}

class MainApp  extends StatelessWidget {
  const MainApp ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

