// packages
import 'package:flutter/material.dart';
// routes
import 'package:isse_app/routes/info.dart';
import 'package:isse_app/routes/map.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zobrazení"),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: [
              ListTile(
                title: const Text("Informace"),
                leading: const Icon(Icons.info),
                selected: selected == 0,
                onTap: selected != 0
                    ? () {
                        setState(() {
                          selected = 0;
                        });
                      }
                    : null,
              ),
              ListTile(
                title: const Text("Mapa"),
                leading: const Icon(Icons.map),
                selected: selected == 1,
                onTap: selected != 1
                    ? () {
                        setState(() {
                          selected = 1;
                        });
                      }
                    : null,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: selected,
                      children: const [
                        InfoPage(),
                        MapPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
