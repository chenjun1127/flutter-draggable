import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gesture_detector_voice.dart';

class CardWidget extends StatefulWidget {
  final int progress;
  final Decoration decorationOpen;
  final Decoration decorationBg;

  final double height;
  final double width;

  const CardWidget(
      {Key? key,
      this.progress = 50,
      this.decorationOpen = decorationOpen1,
      this.decorationBg = decorationBg1,
      this.onChange,
      this.height = 140,
      this.width = 240})
      : super(key: key);

  static const Decoration decorationOpen1 = BoxDecoration(
    color: Color(0x40ffffff), //背景渐变
  );
  static const Decoration decorationBg1 = BoxDecoration(
    color: Color(0xff26262B),
    // color: Color(0xffff9900),
  );

  final void Function(int, bool)? onChange;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int progress = 50;
  bool isDragControl = false; //是否在拖拽
  bool isWidgetControl = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Color.fromARGB((255 * 0.15).toInt(), 255, 255, 255),
      child: GestureDetectorVoice(
        child: Container(
          color: Colors.red,
          child: _linearProgressColumnIndicator(),
        ),
        behavior: HitTestBehavior.opaque,
        onLongPress: () {
          print("长按");
        },
        // onHorizontalDragDown: (DragDownDetails details) {
        //   print("DragDownDetails---$details");
        //   isDragControl = true;
        //   setState(() {
        //     updateProgress(details.localPosition.dx);
        //     widget.onChange?.call(getIntValue, false);
        //   });
        // },
        // onTapUp: (TapUpDetails details) {
        //   print('TapUpDetails-- details.localPosition = ${details.localPosition}');
        //   isDragControl = false;
        //   setState(() {
        //     updateProgress(details.localPosition.dx);
        //     widget.onChange?.call(getIntValue, true);
        //   });
        // },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          print('DragUpdateDetails-- details.localPosition = ${details.localPosition}');
          setState(() {
            updateProgress(details.localPosition.dx);
            widget.onChange?.call(getIntValue, false);
          });
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          isDragControl = false;
          setState(() {
            widget.onChange?.call(getIntValue, true);
          });
        },
      ),
    );
  }

  get getIntValue => progress.round();

  @override
  void initState() {
    print("widget.progress;---${widget.progress}");
    progress = widget.progress;
    super.initState();
  }

  int _getCurrentValue(double y) {
    if (y <= 0) {
      return 0;
    } else if (y >= (widget.width)) {
      return (1 * 100).round();
    }
    double value = (y) / widget.width;
    if (value > 1) {
      value = 1;
    }
    if (value < 0) {
      value = 0.0;
    }
    return (value * 100).round();
  }

  Widget _linearProgressColumnIndicator() {
    print("当前变化亮度：_linearProgressColumnIndicator:$progress-----${widget.width * (progress * 0.01)}");
    return Container(
      width: double.infinity,
      height: widget.height,
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: widget.decorationBg,
          ),
          // DecoratedBox(
          //   decoration: widget.decorationOpen,
          // ),

          Positioned(
            top: 0,
            left: 0,
            child: Container(
              key: ValueKey<int>(isDragControl ? progress : (isWidgetControl ? widget.progress : 0)),
              height: widget.height,
              width: widget.width * (progress * 0.01),
              decoration: widget.decorationOpen,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetectorVoice(
                  onTap: () {
                    print("点击事件");
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "设备名称",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "动作",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateProgress(double dx) {
    progress = _getCurrentValue(dx);
    if (progress < 0) {
      progress = 0;
    }
  }

  @override
  void didUpdateWidget(CardWidget oldWidget) {
    if (!isDragControl) {
      isWidgetControl = true;
      progress = widget.progress;
    }
    super.didUpdateWidget(oldWidget);
  }
}
