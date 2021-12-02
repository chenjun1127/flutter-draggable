import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/components/card_widget.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({Key? key}) : super(key: key);

  static Map<String, WidgetBuilder> route() {
    return {'/card-demo': (BuildContext context) => CardDemo()};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("card-demo"),
      ),
      body: Center(
        child: CardWidget(
          progress: 70,
          onChange: (int, bool) {
            print("回调---$int---value---$bool");
          },
        ),
      ),
    );
  }
}
