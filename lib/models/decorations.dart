import 'package:brook/models/decoration_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "decorations.freezed.dart";

@freezed
class Decorations with _$Decorations {
  const factory Decorations({
    required List<DecorationType> leading,
    required List<DecorationType> trailing,
  }) = _Decorations;
}
