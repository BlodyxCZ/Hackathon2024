import 'package:app_admin/routes/group_list.dart';
import 'package:app_admin/routes/member_viewer.dart';
import 'package:flutter/material.dart';

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
            Text("Společenství Liberec"),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationDrawer(
            children: [
              ListTile(
                title: const Text("Seznam skupin"),
                leading: const Icon(Icons.group),
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
                title: const Text("Informace o členech"),
                leading: const Icon(Icons.insert_chart_outlined_sharp),
                selected: selectedPage == 1,
                onTap: selectedPage == 1
                    ? null
                    : () {
                        setState(() {
                          selectedPage = 1;
                        });
                      },
              ),
              const Spacer(),
              Image.asset(
                "assets/images/logo.png",
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: selectedPage,
              children: const [
                GroupListPage(),
                MemberViewerPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
