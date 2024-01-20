import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedValue = "cez";
  final _inActiveHours = <double>[
    00.00,
    01.00,
    02.00,
    03.00,
    04.00,
    06.00,
    11.00,
    12.00,
    13.00,
    18.00,
    21.00,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: Stack(
                    children: [
                      const Text(
                        "Výběr dodavatele",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton(
                              value: selectedValue,
                              items: const [
                                DropdownMenuItem(
                                  child: Text("Automaticky"),
                                  value: "aut",
                                ),
                                DropdownMenuItem(
                                  child: Text("ČEZ"),
                                  value: "cez",
                                ),
                                DropdownMenuItem(
                                  child: Text("Dodavatel 1"),
                                  value: "dodavatel1",
                                ),
                                DropdownMenuItem(
                                  child: Text("Dodavatel 2"),
                                  value: "dodavatel2",
                                ),
                              ],
                              onChanged: (object) {
                                setState(() {
                                  selectedValue = object.toString();
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Text(
                              {
                                "aut": "Dodavatel 2 - 1,6 Kč/kWh",
                                "cez": "2,35 Kč/kWh",
                                "dodavatel1": "1,4 Kč/kWh",
                                "dodavatel2": "1,6 Kč/kWh",
                              }[selectedValue]!,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Card(
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text("Název"),
                  ),
                  DataColumn(
                    label: Text("Aktuální cena za kWh"),
                  ),
                  DataColumn(
                    label: Text("Dostupnost"),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(
                        Text("ČEZ"),
                      ),
                      DataCell(
                        Text("2,35 Kč"),
                      ),
                      DataCell(
                        LinearProgressIndicator(
                          value: 0.9,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text("Dodavatel 1"),
                      ),
                      DataCell(
                        Text("1,40 Kč"),
                      ),
                      DataCell(
                        LinearProgressIndicator(
                          value: 0.3,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text("Dodavatel 2"),
                      ),
                      DataCell(
                        Text("1,60 Kč"),
                      ),
                      DataCell(
                        LinearProgressIndicator(
                          value: 0.6,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Card(
              child: SizedBox(
                width: 145,
                child: SfLinearGauge(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  tickPosition: LinearElementPosition.cross,
                  majorTickStyle:
                      const LinearTickStyle(color: Colors.green, length: 20),
                  minorTickStyle:
                      const LinearTickStyle(color: Colors.red, length: 10),
                  axisTrackStyle: const LinearAxisTrackStyle(
                      thickness: 1, color: Colors.transparent),
                  ranges: <LinearGaugeRange>[
                    LinearGaugeRange(
                        startValue: 0,
                        startWidth: 70,
                        endWidth: 70,
                        color: Colors.transparent,
                        endValue: 100 - 2,
                        position: LinearElementPosition.cross,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: const Color(0xff4D4D4D), width: 4),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))))),
                    LinearGaugeRange(
                        startValue: 0 + 5,
                        startWidth: 55,
                        endWidth: 55,
                        endValue: 86 < 100 / 4 ? 86 : 100 / 4,
                        position: LinearElementPosition.cross,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)))),
                    LinearGaugeRange(
                        startValue: 86 >= (100 / 4 + 2) ? (100 / 4 + 2) : 0 + 5,
                        endValue: 86 < (100 / 4 + 2)
                            ? 0 + 5
                            : 86 <= 100 / 2
                                ? 86
                                : 100 / 2,
                        startWidth: 55,
                        endWidth: 55,
                        position: LinearElementPosition.cross,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)))),
                    LinearGaugeRange(
                        startValue: 86 >= (100 / 2 + 2) ? (100 / 2 + 2) : 0 + 5,
                        endValue: 86 < (100 / 2 + 2)
                            ? 0 + 5
                            : 86 <= (100 * 3 / 4)
                                ? 86
                                : (100 * 3 / 4),
                        startWidth: 55,
                        endWidth: 55,
                        position: LinearElementPosition.cross,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)))),
                    LinearGaugeRange(
                        startValue:
                            86 >= (100 * 3 / 4 + 2) ? (100 * 3 / 4 + 2) : 0 + 5,
                        endValue: 86 < (100 * 3 / 4 + 2)
                            ? 0 + 5
                            : 86 < 100
                                ? 86
                                : 100 - 7,
                        startWidth: 55,
                        endWidth: 55,
                        position: LinearElementPosition.cross,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)))),
                  ],
                  markerPointers: <LinearMarkerPointer>[
                    LinearWidgetPointer(
                        value: 100,
                        enableAnimation: false,
                        markerAlignment: LinearMarkerAlignment.start,
                        child: Container(
                            height: 38,
                            width: 16,
                            decoration: BoxDecoration(
                                color: const Color(0xff232323),
                                border: Border.all(
                                    color: const Color(0xff4D4D4D), width: 4),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6)))))
                  ],
                  barPointers: <LinearBarPointer>[
                    LinearBarPointer(
                      value: 100,
                      thickness: 30,
                      position: LinearElementPosition.outside,
                      offset: 50,
                      enableAnimation: false,
                      color: Colors.transparent,
                      child: Center(
                        child: Text('Nabito: ' + 86.toStringAsFixed(0) + '%',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SfLinearGauge(
                        showTicks: false,
                        interval: 30,
                        labelOffset: 0,
                        axisTrackStyle: const LinearAxisTrackStyle(
                            thickness: 75, color: Colors.transparent),
                        labelFormatterCallback: (String label) {
                          switch (label) {
                            case '0':
                              return '00:00';
                            case '30':
                              return '06:00';
                            case '60':
                              return '12:00';
                            case '90':
                              return '18:00';
                            case '100':
                              return ' ';
                          }
                          return label;
                        },
                        markerPointers: List<LinearWidgetPointer>.generate(
                          24,
                          (int index) => _buildLinearWidgetPointer(
                              index * 4,
                              _inActiveHours.contains(index)
                                  ? _getInActivePointerColor(
                                      const Color(0xFF05C3DD),
                                      0.7,
                                      Colors.black)
                                  : const Color(0xFF05C3DD)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const Text(
                              'Aktivní hodiny',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Text(
                              (24 - _inActiveHours.length).toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Color(0xFF05C3DD)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color _getInActivePointerColor(Color color, double factor,
    [Color mix = Colors.black]) {
  return color == Colors.transparent
      ? color
      : Color.fromRGBO(
          ((1 - factor) * color.red + factor * mix.red).toInt(),
          ((1 - factor) * color.green + factor * mix.green).toInt(),
          ((1 - factor) * color.blue + factor * mix.blue).toInt(),
          1);
}

LinearWidgetPointer _buildLinearWidgetPointer(double value, Color color) {
  return LinearWidgetPointer(
    value: value,
    enableAnimation: false,
    child: Container(
      height: 75,
      width: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    ),
  );
}
