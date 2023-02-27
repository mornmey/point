import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets margin;
  final double radius;
  final double inkWellRadius;
  final double? width;
  final double? height;
  final double elevation;
  final Widget? child;
  final Widget Function(BorderRadius)? radiusChild;
  final Color color;
  final EdgeInsets padding;
  final RoundedRectangleBorder? shape;
  final VoidCallback? onTap;

  const AppCard({
    Key? key,
    this.child,
    this.radiusChild,
    this.margin = const EdgeInsets.all(0),
    this.elevation = 0,
    this.radius = 30,
    this.inkWellRadius = 30,
    this.width,
    this.height,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(4),
    this.shape,
    this.onTap,
  })  : assert(child == null || radiusChild == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Material(
        elevation: elevation,
        color: color,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(inkWellRadius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: child ?? radiusChild!(BorderRadius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
