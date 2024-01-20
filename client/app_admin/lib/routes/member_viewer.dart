import 'package:flutter/material.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:app_admin/globals.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MemberViewerPage extends StatefulWidget {
  const MemberViewerPage({super.key});

  @override
  State<MemberViewerPage> createState() => _MemberViewerPageState();
}

class _MemberViewerPageState extends State<MemberViewerPage> {
  final controller = TextEditingController();
  Member? selectedMember;
  PickerDateRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          DropDownSearchField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: "Vyhledat člena",
              ),
            ),
            suggestionsCallback: (String filter) {
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
              setState(() {
                controller.text =
                    "${member.name} - ${member.address.replaceAll("\n", " ")} - ${member.type.toString()}";
                selectedMember = member;
              });
            },
            displayAllSuggestionWhenTap: true,
          ),
          if (selectedMember != null)
            Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 400,
                                    width: 400,
                                    child: SfDateRangePicker(
                                      cancelText: "Zrušit",
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                      confirmText: "Vybrat",
                                      onSubmit: (value) {
                                        setState(() {
                                          selectedDateRange =
                                              value as PickerDateRange;
                                        });
                                        Navigator.pop(context);
                                      },
                                      showActionButtons: true,
                                      selectionMode:
                                          DateRangePickerSelectionMode.range,
                                      maxDate: DateTime.now(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text("Vybrat rozmezí datumů"),
                      ),
                      const SizedBox(width: 8),
                      if (selectedDateRange != null)
                        Text(
                          "${selectedDateRange!.startDate!.day}.${selectedDateRange!.startDate!.month}.${selectedDateRange!.startDate!.year} - ${selectedDateRange!.endDate!.day}.${selectedDateRange!.endDate!.month}.${selectedDateRange!.endDate!.year}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dodavatelé:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SfCircularChart(
                                series: <PieSeries<_PieData, String>>[
                                  PieSeries<_PieData, String>(
                                    dataSource: [
                                      _PieData(
                                        "Dodavatel 1",
                                        0.3,
                                        Colors.blue,
                                      ),
                                      _PieData(
                                        "Dodavatel 2",
                                        0.5,
                                        Colors.green,
                                      ),
                                      _PieData(
                                        "ČEZ",
                                        0.2,
                                        Colors.deepOrange,
                                      ),
                                    ],
                                    radius: "80%",
                                    xValueMapper: (_PieData data, _) =>
                                        data.name,
                                    yValueMapper: (_PieData data, _) =>
                                        data.value,
                                    dataLabelMapper: (_PieData data, _) =>
                                        data.name,
                                    pointColorMapper: (_PieData data, _) =>
                                        data.color,
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
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
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _PieData {
  _PieData(this.name, this.value, this.color);
  final String name;
  final double value;
  final Color color;
}
