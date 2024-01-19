import 'package:app_admin/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GroupListPage extends StatefulWidget {
  const GroupListPage({super.key});

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  String filter = "";
  List<Group> filteredGroups(String name) {
    return groups
        .where((element) => element.name.toLowerCase().contains(name))
        .toList();
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Počet skupin: ${groups.length}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Počet členů: ${groups.map((e) => e.members.length).reduce((value, element) => value + element)}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  filter = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                labelText: "Vyhledat skupinu",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      controller.clear();
                      setState(() {
                        filter = "";
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            for (Group group in filteredGroups(filter))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey[850],
                  title: Text(group.name),
                  subtitle: Text("Počet členů: ${group.members.length}"),
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        for (Member member in group.members)
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 4),
                                        child: Text(
                                          member.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("ID: ${2}"),
                                          const SizedBox(width: 16),
                                          Text(member.address),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.person, size: 40),
                                  const SizedBox(width: 16),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                    child: Column(
                                      children: [
                                        Text(member.ean),
                                        Text(member.type.toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
