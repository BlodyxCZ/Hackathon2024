import 'package:flutter/material.dart';
import 'package:app_client_independent/routes/history.dart';

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
            Text("Samostatně činný subjekt"),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: [
              ListTile(
                title: const Text("Spotřeba energie"),
                leading: const Icon(Icons.electric_bolt_rounded),
                selected: selectedPage == 0,
                onTap: selectedPage == 0
                    ? null
                    : () {
                        setState(() {
                          selectedPage = 0;
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
