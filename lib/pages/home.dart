import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static Map<String, WidgetBuilder> route() {
    return {'/': (BuildContext context) => Home()};
  }

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Draggable简单使用'),
                subtitle: Text('Draggable和DragTarget分开实例'),
                onTap: () => Navigator.of(context).pushNamed('/draggable/simple'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('可拖拽排序的GridView'),
                subtitle: Text('Draggable和DragTarget组合实例'),
                onTap: () => Navigator.of(context).pushNamed('/draggable/draggableGrid'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('progress'),
                subtitle: Text('滑动条组件'),
                onTap: () => Navigator.of(context).pushNamed('/progress'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('card-demo'),
                subtitle: Text('手势拖动'),
                onTap: () => Navigator.of(context).pushNamed('/card-demo'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('slider-demo'),
                subtitle: Text('滑块组件'),
                onTap: () => Navigator.of(context).pushNamed('/slider-demo'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('chart-example-demo'),
                subtitle: Text('chart-example-'),
                onTap: () => Navigator.of(context).pushNamed('/chart-demo'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
