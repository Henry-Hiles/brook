import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaru/yaru.dart';
part "decorations.freezed.dart";

@freezed
class Decorations with _$Decorations {
  const factory Decorations({
    required List<YaruWindowControlType> leading,
    required List<YaruWindowControlType> trailing,
  }) = _Decorations;
}
