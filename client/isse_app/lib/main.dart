// packages
import 'package:flutter/material.dart';
// routes
import 'package:isse_app/routes/view.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ISSE Aplikace",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: "/view",
      routes: {
        "/view": (context) => const ViewPage(),
      },
    );
  }
}
