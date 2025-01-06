import 'package:brook/models/decoration_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'package:brook/models/decorations.dart';
import 'package:brook/providers/button_layout_provider.dart';
import "package:collection/collection.dart";
part 'decorations_provider.g.dart';

@riverpod
Decorations decorations(Ref ref) {
  List<DecorationType> parse(String section) => section
      .split(",")
      .map((button) => DecorationType.values.firstWhereOrNull(
            (element) => element.name == button,
          ))
      .nonNulls
      .toList();

  final buttons = ref.watch(buttonLayoutProvider).requireValue;

  final [leading, trailing] = buttons.split(":");
  return Decorations(
    leading: parse(leading),
    trailing: parse(trailing),
  );
}
