import 'package:canal/providers/ytmusic_provider.dart';
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "home_sections_provider.g.dart";

@riverpod
Future<IList<HomeSection>> homeSections(Ref ref) async {
  final yt = await ytmusic(ref);

  return IList(await yt.getHomeSections());
}
