import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SliderButton extends StatefulWidget {
  final double radius;
  final double height;
  final double width;
  final double? buttonSize;
  final double? buttonWidth;
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;
  final Widget? label;
  final BoxShadow? boxShadow;
  final Widget? icon;
  final Future<bool?> Function() action;
  final double dismissThresholds;
  final bool disable;

  SliderButton({
    required this.action,
    this.radius = 100,
    this.boxShadow,
    this.height = 70,
    this.buttonSize,
    this.buttonWidth,
    this.width = 270,
    this.backgroundColor = const Color(0xffe0e0e0),
    this.baseColor = Colors.black87,
    this.buttonColor = Colors.white,
    this.highlightedColor = Colors.white,
    this.label,
    this.icon,
    this.dismissThresholds = 0.75,
    this.disable = false,
  }) : assert((buttonSize ?? 60) <= (height));

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  late bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true ? _control() : Container();
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color:
                widget.disable ? Colors.grey.shade700 : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius)),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Shimmer.fromColors(
                baseColor: widget.disable ? Colors.grey : widget.baseColor,
                highlightColor: widget.highlightedColor,
                child: widget.label ?? Text(''),
              ),
            ),
            Container(
              width: widget.width - (widget.buttonWidth ?? widget.height),
              height: widget.height,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                left: (widget.height -
                        (widget.buttonSize == null
                            ? widget.height
                            : widget.buttonSize!)) /
                    2,
              ),
              child: Container(
                height: widget.buttonSize ?? widget.height,
                width: widget.buttonSize ?? widget.height,
                decoration: BoxDecoration(
                    boxShadow: widget.boxShadow != null
                        ? [
                            widget.boxShadow!,
                          ]
                        : null,
                    color: widget.buttonColor,
                    borderRadius: BorderRadius.circular(widget.radius)),
                child: Center(child: widget.icon),
              ),
            ),
          ],
        ),
      );
}
