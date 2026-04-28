// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchQuery)
final searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'0f3f17cf828cb760b024f6cfaaedb315658ad2d0';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ActiveFilter)
final activeFilterProvider = ActiveFilterProvider._();

final class ActiveFilterProvider
    extends
        $NotifierProvider<
          ActiveFilter,
          ({
            AccessEnum access,
            CategoryEnum category,
            FilterEnum filter,
            StreamingEnum streaming,
          })
        > {
  ActiveFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFilterHash();

  @$internal
  @override
  ActiveFilter create() => ActiveFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({
      AccessEnum access,
      CategoryEnum category,
      FilterEnum filter,
      StreamingEnum streaming,
    })
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({
              AccessEnum access,
              CategoryEnum category,
              FilterEnum filter,
              StreamingEnum streaming,
            })
          >(value),
    );
  }
}

String _$activeFilterHash() => r'f0b64b8fe422e86384444db75b2fe8a96476ab61';

abstract class _$ActiveFilter
    extends
        $Notifier<
          ({
            AccessEnum access,
            CategoryEnum category,
            FilterEnum filter,
            StreamingEnum streaming,
          })
        > {
  ({
    AccessEnum access,
    CategoryEnum category,
    FilterEnum filter,
    StreamingEnum streaming,
  })
  build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({
                AccessEnum access,
                CategoryEnum category,
                FilterEnum filter,
                StreamingEnum streaming,
              }),
              ({
                AccessEnum access,
                CategoryEnum category,
                FilterEnum filter,
                StreamingEnum streaming,
              })
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({
                  AccessEnum access,
                  CategoryEnum category,
                  FilterEnum filter,
                  StreamingEnum streaming,
                }),
                ({
                  AccessEnum access,
                  CategoryEnum category,
                  FilterEnum filter,
                  StreamingEnum streaming,
                })
              >,
              ({
                AccessEnum access,
                CategoryEnum category,
                FilterEnum filter,
                StreamingEnum streaming,
              }),
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredProductions)
final filteredProductionsProvider = FilteredProductionsProvider._();

final class FilteredProductionsProvider
    extends
        $FunctionalProvider<
          List<Production>,
          List<Production>,
          List<Production>
        >
    with $Provider<List<Production>> {
  FilteredProductionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredProductionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredProductionsHash();

  @$internal
  @override
  $ProviderElement<List<Production>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Production> create(Ref ref) {
    return filteredProductions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Production> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Production>>(value),
    );
  }
}

String _$filteredProductionsHash() =>
    r'2e7e433a0cd638f1d4d5c3f575edb35ab0d84d5e';

@ProviderFor(sortedProductions)
final sortedProductionsProvider = SortedProductionsProvider._();

final class SortedProductionsProvider
    extends
        $FunctionalProvider<
          List<Production>,
          List<Production>,
          List<Production>
        >
    with $Provider<List<Production>> {
  SortedProductionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedProductionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedProductionsHash();

  @$internal
  @override
  $ProviderElement<List<Production>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Production> create(Ref ref) {
    return sortedProductions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Production> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Production>>(value),
    );
  }
}

String _$sortedProductionsHash() => r'a48845d13b23f18c71bd85e477ed34d97bfc8a77';
