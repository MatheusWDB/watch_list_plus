// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productionRepository)
final productionRepositoryProvider = ProductionRepositoryProvider._();

final class ProductionRepositoryProvider
    extends
        $FunctionalProvider<
          ProductionRepository,
          ProductionRepository,
          ProductionRepository
        >
    with $Provider<ProductionRepository> {
  ProductionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productionRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductionRepository create(Ref ref) {
    return productionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductionRepository>(value),
    );
  }
}

String _$productionRepositoryHash() =>
    r'1f3e9432b664b0c91922f0a0dccfb958ac820387';

@ProviderFor(ProductionList)
final productionListProvider = ProductionListProvider._();

final class ProductionListProvider
    extends $AsyncNotifierProvider<ProductionList, List<Production>> {
  ProductionListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productionListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productionListHash();

  @$internal
  @override
  ProductionList create() => ProductionList();
}

String _$productionListHash() => r'f4e32a8e8dcb0464ef96b26cb41f788ce4fda41b';

abstract class _$ProductionList extends $AsyncNotifier<List<Production>> {
  FutureOr<List<Production>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Production>>, List<Production>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Production>>, List<Production>>,
              AsyncValue<List<Production>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
