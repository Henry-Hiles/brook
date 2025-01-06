import 'package:brook/widgets/thumbnail.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String thumb;
  final String title;
  final String? subtitle;
  final VoidCallback onClick;
  const Result({
    required this.thumb,
    required this.onClick,
    required this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 64,
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Thumbnail(
              url: thumb,
              onClick: onClick,
            ),
          ),
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: subtitle == null ? null : Text(subtitle!),
        ),
      );
}
