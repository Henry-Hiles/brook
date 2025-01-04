import 'package:adwaita/adwaita.dart';
import 'package:brook/helpers/extension_helper.dart';
import 'package:brook/models/tab.dart';
import 'package:brook/providers/ytmusic_provider.dart';
import 'package:brook/screens/tabs/account.dart';
import 'package:brook/screens/tabs/home.dart';
import 'package:brook/screens/tabs/search.dart';
import 'package:brook/widgets/appbar.dart';
import "package:flutter/material.dart";
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru/yaru.dart';
import 'package:brook/providers/button_layout_provider.dart';
import 'package:brook/providers/warmup_provider.dart';

const List<TabPage> tabs = [HomeTab(), SearchTab(), AccountTab()];

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(0);
    return MaterialApp(
      home: Scaffold(
        body: ref
            .watch(warmupProvider(IList([
              buttonLayoutProvider,
              ytmusicProvider,
            ])))
            .betterWhen(
              data: (_) => YaruDetailPage(
                appBar: const Appbar(title: "Brook"),
                body: tabs[selected.value],
                bottomNavigationBar: NavigationBar(
                  destinations: tabs
                      .map(
                        (tab) => NavigationDestination(
                          icon: Icon(tab.icon),
                          label: tab.title,
                        ),
                      )
                      .toList(),
                  selectedIndex: selected.value,
                  onDestinationSelected: (index) => selected.value = index,
                ),
              ),
            ),
      ),
      theme: AdwaitaThemeData.light().copyWith(
        textTheme: const YaruThemeData().theme?.textTheme,
      ),
      darkTheme: AdwaitaThemeData.dark().copyWith(
        textTheme: const YaruThemeData().darkTheme?.textTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
