import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double value = 1.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(

        //已拖动的颜色
        activeTrackColor: Colors.amberAccent,
        //未拖动的颜色
        inactiveTrackColor: Colors.green,

        //提示进度的气泡的背景色
        valueIndicatorColor: Colors.green,
        //提示进度的气泡文本的颜色
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),

        //滑块中心的颜色
        thumbColor: Colors.blueAccent,
        //滑块边缘的颜色
        overlayColor: Colors.white,

        //divisions对进度线分割后，断续线中间间隔的颜色
        inactiveTickMarkColor: Colors.white,
      ),
      child: Slider(
        value: value,
        label: '$value',
        min: 0.0,
        max: 100.0,
        divisions: 100,
        onChanged: (val) {
          setState(() {
            value = val.floorToDouble(); //转化成double
          });
        },
      ),
    );
  }
}
