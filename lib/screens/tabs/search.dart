import 'package:brook/helpers/extension_helper.dart';
import 'package:brook/widgets/result.dart';
import 'package:collection/collection.dart';
import 'package:brook/providers/search_provider.dart';
import 'package:brook/widgets/thumbnail.dart';
import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:brook/widgets/select_button.dart';
import 'package:brook/models/search_type.dart';
import 'package:brook/models/tab.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchTab extends HookConsumerWidget implements TabPage {
  const SearchTab({super.key});

  @override
  IconData get icon => Icons.search;

  @override
  String get title => "Search";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = useState(SearchType.any);
    final search = useState("");

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      children: [
        SearchBar(
          hintText: "Search YouTube Music...",
          onChanged: (value) => search.value = value,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SelectButton(
            value: type.value,
            values: SearchType.values,
            onChanged: (value) => type.value = value,
          ),
        ),
        Divider(),
        ref
            .watch(searchProviderProvider(
              search: search.value,
              searchType: type.value,
            ))
            .betterWhen(
              data: (results) => LayoutBuilder(
                builder: (_, constraints) {
                  final maxGridSize = (constraints.maxWidth / 3) - 4 * 3 * 2;
                  final gridSize = maxGridSize < 300 ? null : maxGridSize;

                  return Wrap(
                    children: [
                      ...results
                          .mapIndexed((index, result) => switch (result) {
                                SongDetailed _ => Result(
                                    thumb: result.thumbnails.first.url,
                                    onClick: () {},
                                    title: result.name,
                                    subtitle: result.artist.name,
                                  ),
                                AlbumDetailed _ => Result(
                                    thumb: result.thumbnails.first.url,
                                    onClick: () {},
                                    title: result.name,
                                    subtitle: result.artist.name,
                                  ),
                                VideoDetailed _ => Thumbnail(
                                    url: result.thumbnails.first.url,
                                    onClick: () {},
                                    child: Icon(
                                      Icons.play_circle,
                                      size: 48,
                                    ),
                                  ),
                                ArtistDetailed _ => Result(
                                    thumb: result.thumbnails.first.url,
                                    onClick: () {},
                                    title: result.name,
                                  ),
                                PlaylistDetailed _ => Result(
                                    thumb: result.thumbnails.first.url,
                                    subtitle: result.artist.name,
                                    onClick: () {},
                                    title: result.name,
                                  ),
                                _ => throw Exception(
                                    "Unknown Detailed Result: ${result.runtimeType}",
                                  ),
                              })
                          .mapIndexed((index, element) => index == 0
                              ? element
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 6,
                                  ),
                                  child: SizedBox(
                                    width: gridSize?.toDouble(),
                                    child: element,
                                  ),
                                ))
                    ],
                  );
                },
              ),
            ),
      ],
    );
  }
}
