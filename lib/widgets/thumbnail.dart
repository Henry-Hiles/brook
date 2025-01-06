import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onClick;
  final double radius;
  final ShapeBorder? border;
  final Widget? child;
  const Thumbnail({
    super.key,
    required this.url,
    required this.onClick,
    this.radius = 16,
    this.border,
    this.child,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Material(
          child: Ink.image(
            image: NetworkImage(url),
            fit: BoxFit.fill,
            child: InkWell(
              onTap: onClick,
              child: child,
            ),
          ),
        ),
      );
}
