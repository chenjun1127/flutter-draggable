import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/vertical_progress.dart';

/// Created by chenjun on 2021/12/1.
/// @TODO file describe
///
class ProcessDemo extends StatelessWidget {
  const ProcessDemo({Key? key}) : super(key: key);

  static Map<String, WidgetBuilder> route() {
    return {'/progress': (BuildContext context) => ProcessDemo()};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("process-demo"),
      ),
      body: Center(
        child: VerticalProgress(
          topPadding: 0,
          bottomPadding: 0,
          progress: 1,
          textContainerHeight: 0,
          onChange: (int, bool) {
            print("回调---$int---value---$bool");
          },
        ),
      ),
    );
  }
}
