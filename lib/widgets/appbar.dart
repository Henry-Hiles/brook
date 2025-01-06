import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:brook/providers/decorations_provider.dart';
import 'package:brook/models/decoration_type.dart';
import 'package:window_manager/window_manager.dart';

class Appbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const Appbar({
    required this.title,
    super.key,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> getControl(List<DecorationType> types) => [
          SizedBox(width: 6),
          ...types.map(
            (type) {
              final decoration = switch (type) {
                DecorationType.close => (
                    onClick: windowManager.close,
                    icon: AdwaitaIcons.window_close,
                  ),
                DecorationType.maximize => (
                    onClick: windowManager.maximize,
                    icon: AdwaitaIcons.window_maximize,
                  ),
                DecorationType.minimize => (
                    onClick: windowManager.minimize,
                    icon: AdwaitaIcons.window_minimize,
                  ),
                DecorationType.restore => (
                    onClick: windowManager.restore,
                    icon: AdwaitaIcons.window_restore,
                  ),
              };
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    padding: EdgeInsets.all(4),
                    onPressed: decoration.onClick,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    icon: AdwaitaIcon(decoration.icon),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 6),
        ];

    final decorations = ref.watch(decorationsProvider);
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Text(title),
      leading: Row(children: [
        ...getControl(decorations.leading),
        if (Navigator.of(context).canPop())
          BackButton(
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(20),
              minimumSize: WidgetStatePropertyAll(Size.square(0)),
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
          ),
      ]),
      actions: getControl(decorations.trailing),
      centerTitle: true,
    );
  }
}
