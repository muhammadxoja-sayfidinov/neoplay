import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TVFocusableButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final FocusNode focusNode;

  const TVFocusableButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.focusNode,
  });

  @override
  _TVFocusableButtonState createState() => _TVFocusableButtonState();
}

class _TVFocusableButtonState extends State<TVFocusableButton> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onKey: (node, event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.select) {
          widget.onPressed();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  widget.focusNode.hasFocus ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
