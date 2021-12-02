import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/gesture_detector_voice.dart';

/// @desc 目前主要用于色温灯，调光灯，RGB灯卡片中竖直进度条的展示

class VerticalProgress extends StatefulWidget {
  const VerticalProgress({
    Key? key,
    this.width = 88,
    this.height = 300,
    this.progress = 50,
    this.minProgress = 0,
    this.borderRadius = 20,
    this.topPadding = 20,
    this.bottomPadding = 20,
    this.textContainerHeight = 50,
    this.decorationBg = decorationBg1,
    this.decorationOpen = decorationOpen1,
    this.decorationClose = decorationClose1,
    this.onChange,
    this.allowTapChange = false,
  }) : super(key: key);

  final int progress;

  ///最新进度
  final int minProgress;
  final void Function(int, bool)? onChange;
  final double width;
  final double height;
  final double topPadding;
  final double bottomPadding;
  final double borderRadius;
  final double textContainerHeight;

  ///允许点击
  final bool allowTapChange;

  ///最底层颜色
  final Decoration decorationBg;

  ///打开部分的背景
  final Decoration decorationOpen;

  ///关闭部分的背景
  final Decoration decorationClose;

  static const Decoration decorationBg1 = BoxDecoration(
    color: Color(0xff26262B),
  );

  static const Decoration decorationOpen1 = BoxDecoration(
    color: Color(0xffffffff), //背景渐变
  );
  static const Decoration decorationClose1 = BoxDecoration(color: Color(0xff26262B));

  @override
  _VerticalProgressState createState() => _VerticalProgressState();
}

class _VerticalProgressState extends State<VerticalProgress> with SingleTickerProviderStateMixin {
  int progress = 50;

  bool isDragControl = false;
  bool isWidgetControl = true;

  get getIntValue => progress.round();

  int _getCurrentValue(double y) {
    if (y <= 0) {
      return (1 * 100).round();
    } else if (y >= (widget.height)) {
      return 0;
    }
    double value = (widget.height - y) / widget.height;
    if (value > 1) {
      value = 1;
    }
    if (value < 0) {
      value = 0.0;
    }
    return (value * 100).round();
  }

  @override
  void initState() {
    progress = widget.progress;
    super.initState();
  }

  late bool textShow = false;

  Widget _linearProgressColumnIndicator() {
    print("当前变化亮度：_linearProgressColumnIndicator:$progress-----${widget.height * (1 - progress * 0.01)}");
    return Container(
      width: widget.width,
      height: widget.height - widget.textContainerHeight,
      color: Colors.green,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
            decoration: widget.decorationBg,
          ),
          DecoratedBox(
            decoration: widget.decorationOpen,
          ),
          Positioned(
            top: 0,
            child: Container(
              key: ValueKey<int>(isDragControl ? progress : (isWidgetControl ? widget.progress : 0)),
              width: widget.width,
              height: widget.height * (1 - progress * 0.01),
              decoration: widget.decorationClose,
            ),
          ),
          // Positioned(
          //   top: -30,
          //   child: Container(
          //     padding: const EdgeInsets.only(top: 15),
          //     width: widget.width,
          //     color: Colors.red,
          //     alignment: Alignment.center,
          //     child: Text(
          //       progress.toString(),
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height + widget.topPadding + widget.bottomPadding,
      child: GestureDetectorVoice(
        behavior: HitTestBehavior.opaque,
        onVerticalDragDown: (DragDownDetails details) {
          isDragControl = true;
          textShow = true;
          print("DragDownDetails---$details");
          setState(() {
            updateProgress(details.localPosition.dy - widget.topPadding);
            widget.onChange?.call(getIntValue, false);
          });
        },
        onTapUp: (TapUpDetails details) {
          if (widget.allowTapChange) {
            isDragControl = false;
            setState(() {
              updateProgress(details.localPosition.dy - widget.topPadding);
              widget.onChange?.call(getIntValue, true);
            });
          } else {
            isDragControl = false;
          }
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          // print('dragProgress--onVerticalDragUpdate-- details.localPosition = ${details.localPosition}');
          setState(() {
            updateProgress(details.localPosition.dy - widget.topPadding);
            widget.onChange?.call(getIntValue, false);
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          isDragControl = false;
          textShow = false;
          setState(() {
            widget.onChange?.call(getIntValue, true);
          });
        },
        child: Container(
            padding: EdgeInsets.only(top: widget.topPadding, bottom: widget.bottomPadding),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (textShow)
                  Container(
                    padding: const EdgeInsets.only(top: 0),
                    width: widget.width,
                    color: Colors.transparent,
                    height: widget.textContainerHeight,
                    alignment: Alignment.center,
                    child: Text(
                      progress.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                  clipBehavior: Clip.antiAliasWithSaveLayer, // 不能去掉，去掉UI界面有问题
                  child: _linearProgressColumnIndicator(),
                ),
              ],
            )),
      ),
    );
  }

  void updateProgress(double dy) {
    progress = _getCurrentValue(dy);
    if (progress < widget.minProgress) {
      progress = widget.minProgress;
    }
  }

  @override
  void didUpdateWidget(VerticalProgress oldWidget) {
    if (!isDragControl) {
      isWidgetControl = true;
      progress = widget.progress;
    }
    super.didUpdateWidget(oldWidget);
  }
}
