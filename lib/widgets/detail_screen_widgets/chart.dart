
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  final String getRate;
  final String getArea;
  const MyBarChart({Key? key, required this.getRate, required this.getArea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rate = double.parse(getRate);
    double area = double.parse(getArea);
    return DChartBar(
    data: [
        {
          'id': 'Rate',
          'data': [
            {
              'domain': "Area",
              'measure': area,
            },
            {
              'domain': "Rate",
              'measure': rate,
            },
          ],
        },
      ],
      barValue: (barData, index) {
        return index == 0 ? area.toString() : rate.toString();
      },
      animate: true,measureMax: 100,
      borderWidth: 1,
      measureAxisTitleColor: Colors.black,
      showMeasureLine: true,
      showDomainLine: true,
      borderColor: Colors.black,
      domainLabelFontSize: 18,
      domainLabelColor: Colors.black,
      barValuePosition: BarValuePosition.inside,
      barValueFontSize: 18,
      domainLabelPaddingToAxisLine: 20,
      axisLineTick: 2,
      axisLinePointTick: 2,
      axisLinePointWidth: 10,
      axisLineColor: Colors.black,
      measureLabelPaddingToAxisLine: 15,
      barColor: (barData, index, id) => Colors.green.shade300,
      showBarValue: true,
    );
  }
}
