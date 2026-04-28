// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SortConfig)
final sortConfigProvider = SortConfigProvider._();

final class SortConfigProvider
    extends $NotifierProvider<SortConfig, ({bool ascending, SortField field})> {
  SortConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortConfigHash();

  @$internal
  @override
  SortConfig create() => SortConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({bool ascending, SortField field}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({bool ascending, SortField field})>(
        value,
      ),
    );
  }
}

String _$sortConfigHash() => r'6b30909c33235de37f90f84f34c281deeba1e23f';

abstract class _$SortConfig
    extends $Notifier<({bool ascending, SortField field})> {
  ({bool ascending, SortField field}) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({bool ascending, SortField field}),
              ({bool ascending, SortField field})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({bool ascending, SortField field}),
                ({bool ascending, SortField field})
              >,
              ({bool ascending, SortField field}),
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
