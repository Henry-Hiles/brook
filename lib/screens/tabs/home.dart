import 'package:brook/helpers/extension_helper.dart';
import 'package:brook/providers/home_sections_provider.dart';
import 'package:brook/screens/album.dart';
import 'package:brook/screens/playlist.dart';
import 'package:brook/widgets/thumbnail.dart';
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:flutter/material.dart';
import 'package:brook/models/tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTab extends ConsumerWidget implements TabPage {
  const HomeTab({super.key});

  @override
  IconData get icon => Icons.home;

  @override
  String get title => "Home";

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(homeSectionsProvider).betterWhen(
            data: (sections) => ListView(
              padding: EdgeInsets.symmetric(vertical: 4),
              children: sections
                  .where((element) => element.contents.isNotEmpty)
                  .map(
                    (section) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            section.title,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          subtitle: SizedBox(
                            height: 266,
                            child: ListView(
                              padding: EdgeInsets.only(top: 6),
                              itemExtent: 268,
                              scrollDirection: Axis.horizontal,
                              children: section.contents
                                  .map(
                                    (song) => Padding(
                                      padding: EdgeInsets.only(
                                        right: 12,
                                        bottom: 4,
                                        top: 2,
                                      ),
                                      child: Thumbnail(
                                        url: song.thumbnails.first.url,
                                        onClick: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (_) => switch (song) {
                                            PlaylistDetailed _ =>
                                              PlaylistPage(),
                                            AlbumDetailed _ => AlbumPage(),
                                            _ => throw "Unknown type",
                                          },
                                        )),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
}
