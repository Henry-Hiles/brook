import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:brook/providers/decorations_provider.dart';
import 'package:yaru/yaru.dart';

class Appbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const Appbar({
    required this.title,
    super.key,
  });

  @override
  Size get preferredSize => const YaruWindowTitleBar().preferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = YaruWindow.of(context);

    List<Widget> getControl(List<YaruWindowControlType> types) => [
          const SizedBox(width: 6),
          ...types.map(
            (type) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: YaruWindowControl(
                type: type,
                onTap: switch (type) {
                  YaruWindowControlType.close => window.close,
                  YaruWindowControlType.maximize => () => window.state().then(
                        (state) => state.isMaximized!
                            ? window.restore()
                            : window.maximize(),
                      ),
                  YaruWindowControlType.minimize => window.minimize,
                  YaruWindowControlType.restore => window.restore,
                },
              ),
            ),
          ),
          const SizedBox(width: 6),
        ];

    final decorations = ref.watch(decorationsProvider);

    return YaruWindowTitleBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      leading: Row(children: [
        SizedBox(width: 12),
        if (Navigator.of(context).canPop())
          BackButton(
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(20),
              minimumSize: WidgetStatePropertyAll(Size.square(0)),
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
          ),
        ...getControl(decorations.leading)
      ]),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 12),
      actions: getControl(decorations.trailing),
      border: BorderSide.none,
      style: YaruTitleBarStyle.undecorated,
    );
  }
}
