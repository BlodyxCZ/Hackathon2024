// packages
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// files
import 'package:isse_app/functions.dart';
import 'package:isse_app/globals.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Location? selectedLocation;
  PickerDateRange? selectedDateRange;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: DropDownSearchFormField(
            suggestionsBoxDecoration: const SuggestionsBoxDecoration(),
            textFieldConfiguration: const TextFieldConfiguration(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Lokace",
              ),
            ),
            onSuggestionSelected: (suggestion) {
              setState(() {
                selectedLocation = suggestion;
              });
            },
            suggestionsCallback: (pattern) {
              return searchLocations(pattern);
            },
            noItemsFoundBuilder: (context) {
              return const ListTile(
                title: Text("Žádné výsledky"),
              );
            },
            itemBuilder: (context, itemData) {
              return ListTile(
                title: Text(
                  "${itemData.memberOwner.firstName} ${itemData.memberOwner.lastName}",
                ),
                subtitle: Text(
                  "${itemData.address.street} ${itemData.address.code}, ${itemData.address.postalCode} ${itemData.address.city}",
                ),
              );
            },
          ),
        ),
        if (selectedLocation != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      child: const Text("Rozmezí datumů"),
                    ),
                    if (selectedDateRange != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          "${selectedDateRange!.startDate!.day}.${selectedDateRange!.startDate!.month}.${selectedDateRange!.startDate!.year} - ${selectedDateRange!.endDate!.day}.${selectedDateRange!.endDate!.month}.${selectedDateRange!.endDate!.year}",
                        ),
                      ),
                  ],
                ),
                if (selectedDateRange != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 64, 0, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 0,
                              sections: [
                                PieChartSectionData(
                                  color: Colors.deepOrange,
                                  value: 0.4,
                                  title: "ČEZ",
                                  radius: 50,
                                ),
                                PieChartSectionData(
                                  color: Colors.blue,
                                  value: 0.6,
                                  title: "Lukáš Moravec",
                                  titlePositionPercentageOffset: 2,
                                  radius: 50,
                                ),
                                PieChartSectionData(
                                  color: Colors.green,
                                  value: 0.6,
                                  title: "Lukáš Slezák",
                                  titlePositionPercentageOffset: 1.5,
                                  radius: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }
}
