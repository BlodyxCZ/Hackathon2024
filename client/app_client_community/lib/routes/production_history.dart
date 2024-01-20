import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ProductionHistory extends StatefulWidget {
  const ProductionHistory({super.key});

  @override
  State<ProductionHistory> createState() => _ProductionHistoryPageState();
}

class _ProductionHistoryPageState extends State<ProductionHistory> {
  final chartData = <ChartSampleData>[
    ChartSampleData(
        x: "1/2023",
        y: 8445,
        secondSeriesYValue: 8268,
        thirdSeriesYValue: 8686),
    ChartSampleData(
        x: "2/2023",
        y: 6817,
        secondSeriesYValue: 7531,
        thirdSeriesYValue: 8178),
    ChartSampleData(
        x: "3/2023",
        y: 7777,
        secondSeriesYValue: 7640,
        thirdSeriesYValue: 7694),
    ChartSampleData(
        x: "4/2023",
        y: 5073,
        secondSeriesYValue: 5237,
        thirdSeriesYValue: 5825),
    ChartSampleData(
        x: "5/2023",
        y: 3209,
        secondSeriesYValue: 3507,
        thirdSeriesYValue: 3929),
    ChartSampleData(
      x: "6/2023",
      y: 3443,
      secondSeriesYValue: 3581,
      thirdSeriesYValue: 3765,
    ),
  ];

// Returns the list of chart series which need to render on the barchart.
  List<BarSeries<ChartSampleData, String>> _getDefaultBarSeries() {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          color: Colors.deepOrange,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'ČEZ'),
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          color: Colors.green,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Spotřebitel 1'),
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          color: Colors.blue,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Spotřebitel 2')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Card(
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                title: const ChartTitle(
                  text: "Výdej energie",
                ),
                legend: const Legend(isVisible: true),
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  title: AxisTitle(text: "Měsíc"),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  title: AxisTitle(text: "kWh"),
                ),
                series: _getDefaultBarSeries(),
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Chart sample data
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
