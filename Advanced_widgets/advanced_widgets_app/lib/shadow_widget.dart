import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShadowWidget extends SingleChildRenderObjectWidget {
  const ShadowWidget({
    required Widget child,
    super.key,
  }) : super(child: child);

  @override
  RenderText createRenderObject(BuildContext context) {
    return RenderText();
  }
}

class RenderText extends RenderProxyBox {
  RenderText({RenderBox? child}) : super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
      context.paintChild(child!, Offset(offset.dx + 3, offset.dy + 3));
    }
  }
}
