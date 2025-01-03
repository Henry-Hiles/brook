import 'package:flutter/material.dart';
import 'package:canal/models/tab.dart';
import 'package:yaru/yaru.dart';

class SearchTab extends StatelessWidget implements TabPage {
  const SearchTab({super.key});

  @override
  IconData get icon => Icons.search;

  @override
  String get title => "Search";

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: [
          SegmentedButton(
            segments: [
              ButtonSegment(value: 0, label: Text("Foo")),
              ButtonSegment(value: 1, label: Text("Bar")),
              ButtonSegment(value: 2, label: Text("Foobar"))
            ],
            selected: {0},
          )
        ],
      );
}
