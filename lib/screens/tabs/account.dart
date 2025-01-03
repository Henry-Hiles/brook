import 'package:flutter/material.dart';
import 'package:canal/models/tab.dart';

class AccountTab extends StatelessWidget implements TabPage {
  const AccountTab({super.key});

  @override
  IconData get icon => Icons.person;

  @override
  String get title => "Account";

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "Coming soon...",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      );
}
