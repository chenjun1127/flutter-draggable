import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/chart/line_chart_sample2.dart';
/*
 * @Description fl_chart实例
 * @Author chenjun
 * @Date 2021/12/9 10:55 AM
 * @Param
 * @Return
 */
class ChartDemo extends StatelessWidget {
  const ChartDemo({Key? key}) : super(key: key);

  static Map<String, WidgetBuilder> route() {
    return {'/chart-demo': (BuildContext context) => ChartDemo()};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("chart-demo"),
      ),
      body: Center(
        child: LineChartSample2(),
      ),
    );
  }
}
