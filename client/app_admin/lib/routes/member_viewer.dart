import 'package:flutter/material.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:app_admin/globals.dart';

class MemberViewerPage extends StatefulWidget {
  const MemberViewerPage({super.key});

  @override
  State<MemberViewerPage> createState() => _MemberViewerPageState();
}

class _MemberViewerPageState extends State<MemberViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          DropDownSearchField(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                hintText: "Vyhledat člena",
              ),
            ),
            suggestionsCallback: (String filter) {
              // return all members from all groups that contain the filter string
              return groups
                  .map((e) => e.members
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(filter.toLowerCase()))
                      .toList())
                  .reduce((value, element) => value + element);
            },
            itemBuilder: (context, Member member) {
              return ListTile(
                title: Text(member.name),
                leading: const Icon(Icons.person),
                subtitle: Row(
                  children: [
                    Text(member.address),
                    const SizedBox(width: 8),
                    Text(member.type.toString()),
                  ],
                ),
              );
            },
            onSuggestionSelected: (Member member) {
              print(member.name);
            },
            displayAllSuggestionWhenTap: true,
          )
        ],
      ),
    );
  }
}
