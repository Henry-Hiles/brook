import 'package:canal/models/search_type.dart';
import 'package:canal/widgets/select_button.dart';
import 'package:flutter/material.dart';
import 'package:canal/models/tab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchTab extends HookWidget implements TabPage {
  const SearchTab({super.key});

  @override
  IconData get icon => Icons.search;

  @override
  String get title => "Search";

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: [
          SelectButton(
            values: SearchType.values,
            defaultValue: SearchType.any,
          )
        ],
      );
}
