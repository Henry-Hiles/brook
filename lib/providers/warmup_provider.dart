import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "warmup_provider.g.dart";

@riverpod
Future<void> warmup(
  Ref ref,
  IList<AutoDisposeFutureProvider> providers,
) async =>
    await Future.wait(
      providers.map(
        (provider) => ref.watch(provider.future),
      ),
    );
