import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dart_ytmusic_api/yt_music.dart';
part "ytmusic_provider.g.dart";

@riverpod
Future<YTMusic> ytmusic(Ref ref) async => YTMusic().initialize();
