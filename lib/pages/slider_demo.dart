import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/slider_widget.dart';

class SliderDemo extends StatelessWidget {
  const SliderDemo({Key? key}) : super(key: key);

  static Map<String, WidgetBuilder> route() {
    return {'/slider-demo': (BuildContext context) => SliderDemo()};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("slider-demo"),
      ),
      body: Center(
        child: SliderWidget(),
      ),
    );
  }
}
