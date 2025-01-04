import 'package:brook/helpers/extension_helper.dart';
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
              search: search.value,
              searchType: type.value,
            ))
            .betterWhen(
              data: (results) => Column(
                children: results
                    .mapIndexed((index, result) => switch (result) {
                          SongDetailed _ => Builder(builder: (_) {
                              final padding =
                                  EdgeInsets.symmetric(horizontal: 16);
                              final leading = Thumbnail(
                                url: result.thumbnails.first.url,
                                onClick: () {},
                              );
                              return index == 0
                                  ? SizedBox(
                                      height: 128,
                                      child: YaruBanner.tile(
                                        padding: padding,
                                        icon: leading,
                                        title: Text(result.name),
                                        subtitle: Text(result.artist.name),
                                      ),
                                    )
                                  : YaruTile(
                                      padding: padding,
                                      leading: leading,
                                      title: Text(result.name),
                                      subtitle: Text(result.artist.name),
                                    );
                            }),
                          AlbumDetailed _ => Thumbnail(
                              url: result.thumbnails.first.url,
                              onClick: () {},
                            ),
                          VideoDetailed _ => Thumbnail(
                              url: result.thumbnails.first.url,
                              onClick: () {},
                              radius: 0,
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
                        })
                    .map((element) => Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: element,
                        ))
                    .toList(),
              ),
            ),
      ],
    );
  }
}
