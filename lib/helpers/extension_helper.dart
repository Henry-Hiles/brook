import 'package:canal/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BetterWhen<T> on AsyncValue<T> {
  Widget betterWhen({
    required Widget Function(T) data,
    Widget Function() loading = Loading.new,
  }) =>
      when(
        data: data,
        error: (error, stackTrace) =>
            Text("error"), // TODO: Better err reporting
        loading: loading,
        skipLoadingOnRefresh: false,
      );
}
