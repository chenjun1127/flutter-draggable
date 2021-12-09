import 'package:flutter/material.dart';
import 'package:test_app/darggable/draggable_grid_widget.dart.dart';
import 'package:test_app/darggable/draggable_simple.dart';
import 'package:test_app/pages/card_demo.dart';
import 'package:test_app/pages/chart_demo.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/process_demo.dart';
import 'package:test_app/pages/slider_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    Map<String, WidgetBuilder> routesMap = Map<String, WidgetBuilder>();
    routesMap.addAll(Home.route());
    routesMap.addAll(HJDraggableGridWidget.route());
    routesMap.addAll(HJDraggableSimpleDemo.route());
    routesMap.addAll(ProcessDemo.route());
    routesMap.addAll(CardDemo.route());
    routesMap.addAll(SliderDemo.route());
    routesMap.addAll(ChartDemo.route());
    return routesMap;
  }
}
