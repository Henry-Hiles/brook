import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onClick;
  final double radius;
  const Thumbnail({
    super.key,
    required this.url,
    required this.onClick,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: InkWell(
            onTap: onClick,
            child: Image.network(
              url,
              fit: BoxFit.fill,
            )),
      );
}
