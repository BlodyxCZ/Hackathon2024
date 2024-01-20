import 'package:app_client_community/routes/settings.dart';
import 'package:flutter/material.dart';
import 'package:app_client_community/routes/consumption_history.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home),
            SizedBox(width: 8),
            Text("Společenství Liberec - Skupina 1"),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: [
              ListTile(
                title: const Text("Historie spotřeby"),
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
                title: const Text("Nastavení spotřeby"),
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
                ConsumptionHistoryPage(),
                SettingsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
