import 'package:flutter/material.dart';
import 'routes/view.dart';
import 'routes/view2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ISSE Klient - Člen společenství",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: "/view",
      routes: {
        "/view": (context) => const ViewPage(),
        "/view2": (context) => const ViewPage2(),
      },
    );
  }
}
