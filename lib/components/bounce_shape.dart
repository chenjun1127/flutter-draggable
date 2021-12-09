import 'package:flutter/material.dart';
/*
 * @Description 解决slider滑块组件左边高度与右边调度不一致的问题
 * @Author chenjun
 * @Date 2021/12/9 10:51 AM
 * @Param
 * @Return
 */
class BounceShape extends RoundedRectSliderTrackShape {

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required Offset thumbCenter,
      bool isDiscrete = false,
      bool isEnabled = false,
      double additionalActiveTrackHeight = 0}) {
    super.paint(context, offset,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        enableAnimation: enableAnimation,
        textDirection: textDirection,
        thumbCenter: thumbCenter,
        additionalActiveTrackHeight: additionalActiveTrackHeight);
  }
}
