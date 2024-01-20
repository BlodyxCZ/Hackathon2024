import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ConsumptionHistoryPage extends StatefulWidget {
  const ConsumptionHistoryPage({super.key});

  @override
  State<ConsumptionHistoryPage> createState() => _ConsumptionHistoryPageState();
}

class _ConsumptionHistoryPageState extends State<ConsumptionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: const ChartTitle(
                text: "Historie spotřeby v kWh",
              ),
              primaryXAxis:
                  const DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 40,
                interval: 10,
                labelFormat: r'{value}',
                title: AxisTitle(text: "kWh"),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
              ),
              series: _getDefaultDateTimeSeries(),
              trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                tooltipSettings:
                    const InteractiveTooltip(format: 'point.x : point.y kWh'),
              ),
            ),
          ),
          Card(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: const ChartTitle(
                text: "Historie spotřeby kWh u dodavatelů",
              ),
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                  maximum: 20,
                  minimum: 0,
                  interval: 4,
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(size: 0)),
              series: _getDefaultColumn(),
              legend: const Legend(isVisible: true),
              //tooltipBehavior: _tooltipBehavior,
            ),
          )
        ],
      ),
    );
  }
}

final chartData = <ChartSampleData>[
  ChartSampleData(
    x: DateTime(2023, 1).month.toString() +
        "/" +
        DateTime(2023, 1).year.toString(),
    y: 16,
    secondSeriesYValue: 8,
    thirdSeriesYValue: 13,
  ),
  ChartSampleData(
    x: DateTime(2023, 2).month.toString() +
        "/" +
        DateTime(2023, 2).year.toString(),
    y: 8,
    secondSeriesYValue: 10,
    thirdSeriesYValue: 7,
  ),
  ChartSampleData(
    x: DateTime(2023, 3).month.toString() +
        "/" +
        DateTime(2023, 3).year.toString(),
    y: 12,
    secondSeriesYValue: 10,
    thirdSeriesYValue: 5,
  ),
  ChartSampleData(
    x: DateTime(2023, 4).month.toString() +
        "/" +
        DateTime(2023, 4).year.toString(),
    y: 4,
    secondSeriesYValue: 8,
    thirdSeriesYValue: 14,
  ),
  ChartSampleData(
    x: DateTime(2023, 5).month.toString() +
        "/" +
        DateTime(2023, 5).year.toString(),
    y: 8,
    secondSeriesYValue: 5,
    thirdSeriesYValue: 4,
  ),
];

///Get the column series
List<ColumnSeries<ChartSampleData, String>> _getDefaultColumn() {
  return <ColumnSeries<ChartSampleData, String>>[
    ColumnSeries<ChartSampleData, String>(
      width: 0.8,
      spacing: 0.2,
      dataSource: chartData,
      color: Colors.deepOrange,
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
      name: 'ČEZ',
    ),
    ColumnSeries<ChartSampleData, String>(
      dataSource: chartData,
      width: 0.8,
      spacing: 0.2,
      color: Colors.blue,
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      name: 'Dodavatel 1',
    ),
    ColumnSeries<ChartSampleData, String>(
      dataSource: chartData,
      width: 0.8,
      spacing: 0.2,
      color: Colors.green,
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
      name: 'Dodavatel 2',
    ),
  ];
}

List<LineSeries<ChartSampleData, DateTime>> _getDefaultDateTimeSeries() {
  Random random = Random();
  return <LineSeries<ChartSampleData, DateTime>>[
    LineSeries<ChartSampleData, DateTime>(
      dataSource: <ChartSampleData>[
        ChartSampleData(x: DateTime(2023, 1), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 2), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 3), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 4), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 5), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 6), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 7), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 8), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 9), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 10), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 11), yValue: random.nextInt(31) + 9),
        ChartSampleData(x: DateTime(2023, 12), yValue: random.nextInt(31) + 9),
      ],
      xValueMapper: (ChartSampleData data, _) => data.x as DateTime,
      yValueMapper: (ChartSampleData data, _) => data.yValue,
      color: const Color.fromRGBO(242, 117, 7, 1),
    )
  ];
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
