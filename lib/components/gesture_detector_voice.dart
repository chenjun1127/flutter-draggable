import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

/// 播放声音的GestureDetector组件
class GestureDetectorVoice extends GestureDetector {
  GestureDetectorVoice({
    Key? key,
    Widget? child,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapCallback? onSecondaryTap,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureTapCancelCallback? onTertiaryTapCancel,
    GestureTapDownCallback? onDoubleTapDown,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureLongPressCallback? onSecondaryLongPress,
    GestureLongPressStartCallback? onSecondaryLongPressStart,
    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    GestureLongPressUpCallback? onSecondaryLongPressUp,
    GestureLongPressEndCallback? onSecondaryLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool? excludeFromSemantics,
    DragStartBehavior? dragStartBehavior,
  }) : super(
    key: key,
    child: child,
    onTapDown: (TapDownDetails event) {
      if (onTapDown is Function) onTapDown!(event);
    },
    onTapUp: onTapUp,
    onTap: onTap,
    onTapCancel: onTapCancel,
    onSecondaryTap: onSecondaryTap,
    onSecondaryTapDown: onSecondaryTapDown,
    onSecondaryTapUp: onSecondaryTapUp,
    onSecondaryTapCancel: onSecondaryTapCancel,
    onTertiaryTapDown: onTertiaryTapDown,
    onTertiaryTapUp: onTertiaryTapUp,
    onTertiaryTapCancel: onTertiaryTapCancel,
    onDoubleTapDown: onDoubleTapDown,
    onDoubleTap: onDoubleTap,
    onDoubleTapCancel: onDoubleTapCancel,
    onLongPress: onLongPress,
    onLongPressStart: onLongPressStart,
    onLongPressMoveUpdate: onLongPressMoveUpdate,
    onLongPressUp: onLongPressUp,
    onLongPressEnd: onLongPressEnd,
    onSecondaryLongPress: onSecondaryLongPress,
    onSecondaryLongPressStart: onSecondaryLongPressStart,
    onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
    onSecondaryLongPressUp: onSecondaryLongPressUp,
    onSecondaryLongPressEnd: onSecondaryLongPressEnd,
    onVerticalDragDown: onVerticalDragDown,
    onVerticalDragStart: onVerticalDragStart,
    onVerticalDragUpdate: onVerticalDragUpdate,
    onVerticalDragEnd: onVerticalDragEnd,
    onVerticalDragCancel: onVerticalDragCancel,
    onHorizontalDragDown: onHorizontalDragDown,
    onHorizontalDragStart: onHorizontalDragStart,
    onHorizontalDragUpdate: onHorizontalDragUpdate,
    onHorizontalDragEnd: onHorizontalDragEnd,
    onHorizontalDragCancel: onHorizontalDragCancel,
    onForcePressStart: onForcePressStart,
    onForcePressPeak: onForcePressPeak,
    onForcePressUpdate: onForcePressUpdate,
    onForcePressEnd: onForcePressEnd,
    onPanDown: onPanDown,
    onPanStart: onPanStart,
    onPanUpdate: onPanUpdate,
    onPanEnd: onPanEnd,
    onPanCancel: onPanCancel,
    onScaleStart: onScaleStart,
    onScaleUpdate: onScaleUpdate,
    onScaleEnd: onScaleEnd,
    behavior: behavior,
    excludeFromSemantics: excludeFromSemantics ?? false,
    dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
  );
}

/// 播放声音的FlatButton组件
class FlatButtonVoice extends FlatButton {
  FlatButtonVoice({
    Key? key,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    ButtonTextTheme? textTheme,
    Color? textColor,
    Color? disabledTextColor,
    Color? color,
    Color? disabledColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Brightness? colorBrightness,
    EdgeInsetsGeometry? padding,
    VisualDensity? visualDensity,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    bool autofocus = false,
    MaterialTapTargetSize? materialTapTargetSize,
    required Widget child,
    double? height,
    double? minWidth,
  })  : assert(clipBehavior != null),
        assert(autofocus != null),
        super(
        key: key,
        height: height,
        minWidth: minWidth,
        onPressed: () {
          if (onPressed is Function) onPressed();
        },
        onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,
        mouseCursor: mouseCursor,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        visualDensity: visualDensity,
        shape: shape,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        materialTapTargetSize: materialTapTargetSize,
        child: child,
      );
}
