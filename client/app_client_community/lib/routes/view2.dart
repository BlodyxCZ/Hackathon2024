import 'package:app_client_community/routes/production_history.dart';
import 'package:app_client_community/routes/settings2.dart';
import 'package:flutter/material.dart';

class ViewPage2 extends StatefulWidget {
  const ViewPage2({super.key});

  @override
  State<ViewPage2> createState() => _ViewPage2State();
}

class _ViewPage2State extends State<ViewPage2> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home),
            SizedBox(width: 8),
            Text("Společenství Liberec - Skupina 1 - Výdejce"),
            const SizedBox(
              width: 16,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/view");
              },
              child: Text("Přepnout na Příjemce"),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: [
              ListTile(
                title: const Text("Historie výdeje"),
                leading: const Icon(Icons.history),
                selected: selectedPage == 0,
                onTap: selectedPage == 0
                    ? null
                    : () {
                        setState(() {
                          selectedPage = 0;
                        });
                      },
              ),
              ListTile(
                title: const Text("Nastavení výdeje"),
                leading: const Icon(Icons.settings),
                selected: selectedPage == 1,
                onTap: selectedPage == 1
                    ? null
                    : () {
                        setState(() {
                          selectedPage = 1;
                        });
                      },
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: selectedPage,
              children: const [
                ProductionHistory(),
                SettingsPage2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
