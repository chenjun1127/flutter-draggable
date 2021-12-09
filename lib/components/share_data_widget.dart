import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);
  final int data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  /*
   * @Description 该回调决定当data发生变化时，是否通知子树中依赖data的Widget,如果返回true，则子树中依赖(build函数中有调用)本widget
   * 的子widget的`state.didChangeDependencies`会被调用
   * @Author chenjun
   * @Date 2021/12/9 11:38 AM
   * @Param
   * @Return
   */
  @override
  bool updateShouldNotify(ShareDataWidget old) => old.data != data;
}
