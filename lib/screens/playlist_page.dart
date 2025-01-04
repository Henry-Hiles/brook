import 'package:brook/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Appbar(title: "Playlist"),
        body: Center(
          child: Text(
            "Coming soon...",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      );
}
