import 'package:gsettings/gsettings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'button_layout_provider.g.dart';

@riverpod
Future<String> buttonLayout(Ref ref) =>
    GSettings('org.gnome.desktop.wm.preferences')
        .get("button-layout")
        .then((dbusValue) => dbusValue.asString());
