import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "package.freezed.dart";

@freezed
class Package with _$Package {
  const factory Package({
    required String name,
    required String author,
    required Color color,
    required Widget icon,
  }) = _Package;
}
