import 'package:brook/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Appbar(title: "Album"),
        body: Center(
          child: Text(
            "Coming soon...",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      );
}
