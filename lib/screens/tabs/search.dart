import 'package:canal/helpers/extension_helper.dart';
import 'package:canal/providers/search_provider.dart';
import 'package:canal/widgets/thumbnail.dart';
import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:canal/widgets/select_button.dart';
import 'package:canal/models/search_type.dart';
import 'package:canal/models/tab.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru/yaru.dart';

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
    final debouncedSearch = useDebounced(search, Duration(milliseconds: 250));

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      children: [
        YaruSearchField(
          hintText: "Search YouTube music...",
          fillColor: Theme.of(context).colorScheme.surface,
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
        SizedBox(height: 8),
        ref
            .watch(searchProviderProvider(
                search: search.value, searchType: type.value))
            .betterWhen(
                data: (results) => Wrap(
                    children: results
                        .map((result) => SizedBox(
                            height: 64,
                            width: 64,
                            child: switch (result) {
                              SongDetailed _ => Thumbnail(
                                  url: result.thumbnails.first.url,
                                  onClick: () {},
                                ),
                              AlbumDetailed _ => Thumbnail(
                                  url: result.thumbnails.first.url,
                                  onClick: () {},
                                ),
                              VideoDetailed _ => Thumbnail(
                                  url: result.thumbnails.first.url,
                                  onClick: () {},
                                ),
                              ArtistDetailed _ => Thumbnail(
                                  url: result.thumbnails.first.url,
                                  onClick: () {},
                                ),
                              PlaylistDetailed _ => Thumbnail(
                                  url: result.thumbnails.first.url,
                                  onClick: () {},
                                ),
                              _ => throw Exception(
                                  "Unknown Detailed Result: ${result.runtimeType}",
                                ),
                            }))
                        .toList())),
      ],
    );
  }
}
