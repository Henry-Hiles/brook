import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onClick;
  const Thumbnail({required this.url, required this.onClick, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: InkWell(
            onTap: onClick,
            child: Image.network(
              url,
              fit: BoxFit.fill,
            )),
      );
}
