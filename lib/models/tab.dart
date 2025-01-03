import 'package:flutter/widgets.dart';

abstract class TabPage extends Widget {
  const TabPage({super.key});

  String get title;
  IconData get icon;
}
