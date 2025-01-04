import 'package:flutter/material.dart';
import 'package:brook/models/package.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  const PackageCard(this.package, {super.key});

  @override
  Widget build(BuildContext context) => Card(
        color: package.color,
        child: ListTile(
          title: Text(
            package.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            package.author,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              width: 48,
              child: package.icon,
            ),
          ),
        ),
      );
}
