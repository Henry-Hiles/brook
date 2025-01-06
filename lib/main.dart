import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:brook/widgets/app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(WindowOptions(
    minimumSize: Size.square(500),
    titleBarStyle: TitleBarStyle.hidden,
  ));

  runApp(const ProviderScope(child: App()));
}
