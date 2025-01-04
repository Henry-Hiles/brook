import 'package:canal/models/search_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:canal/providers/ytmusic_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
part "search_provider.g.dart";

@riverpod
Future<IList<dynamic>> searchProvider(
  Ref ref, {
  required String search,
  required SearchType searchType,
}) async {
  final yt = await ytmusic(ref);
  return IList(switch (searchType) {
    SearchType.any => await yt.search(search),
    SearchType.songs => await yt.searchSongs(search),
    SearchType.albums => await yt.searchAlbums(search),
    SearchType.videos => await yt.searchVideos(search),
    SearchType.artists => await yt.searchAlbums(search),
    SearchType.playlists => await yt.searchPlaylists(search),
  });
}
