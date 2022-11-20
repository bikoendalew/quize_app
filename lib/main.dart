import 'package:flutter/material.dart';
import 'package:quize_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trivia',
      theme: ThemeData(
          fontFamily: 'ArchitectsDaughter',
          scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30,1.0),
      ),
      home:  const HomePage(),
    );
  }
}

