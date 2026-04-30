import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchlist_plus/enums/access_enum.dart';
import 'package:watchlist_plus/enums/category_enum.dart';
import 'package:watchlist_plus/enums/filter_enum.dart';
import 'package:watchlist_plus/enums/sort_enum.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/providers/sort_provider.dart';

part 'search_provider.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String value) => state = value;
  void clear() => state = '';
}

@riverpod
class ActiveFilter extends _$ActiveFilter {
  static const _empty = (
    filter: FilterEnum.all,
    category: CategoryEnum.absent,
    streaming: StreamingEnum.absent,
    access: AccessEnum.absent,
  );

  @override
  ({
    FilterEnum filter,
    CategoryEnum category,
    StreamingEnum streaming,
    AccessEnum access,
  })
  build() => _empty;

  void reset() => state = _empty;

  void setCategory(CategoryEnum category) => state = (
    filter: FilterEnum.category,
    category: category,
    streaming: StreamingEnum.absent,
    access: AccessEnum.absent,
  );

  void setStreaming(StreamingEnum streaming) => state = (
    filter: FilterEnum.streaming,
    category: CategoryEnum.absent,
    streaming: streaming,
    access: AccessEnum.absent,
  );

  void setAccess(AccessEnum access) => state = (
    filter: FilterEnum.access,
    category: CategoryEnum.absent,
    streaming: StreamingEnum.absent,
    access: access,
  );
}

@Riverpod(keepAlive: true)
List<Production> filteredProductions(Ref ref) {
  final asyncList = ref.watch(productionListProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final f = ref.watch(activeFilterProvider);

  final all = asyncList.when(
    data: (list) => list,
    loading: () => <Production>[],
    error: (_, _) => <Production>[],
  );

  final searched = query.isEmpty
      ? all
      : all.where((p) => p.title.toLowerCase().contains(query)).toList();

  return switch (f.filter) {
    FilterEnum.all => searched,
    FilterEnum.category =>
      searched.where((p) => p.category == f.category).toList(),
    FilterEnum.streaming =>
      searched
          .where((p) => p.streaming.any((s) => s.service == f.streaming))
          .toList(),
    FilterEnum.access =>
      searched
          .where((p) => p.streaming.any((s) => s.access == f.access))
          .toList(),
  };
}

@Riverpod(keepAlive: true)
List<Production> sortedProductions(Ref ref) {
  final list = ref.watch(filteredProductionsProvider);
  final sort = ref.watch(sortConfigProvider);

  final sorted = [...list];

  int compare(Production a, Production b) {
    final result = switch (sort.field) {
      SortField.title => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
      SortField.createdAt => a.createdAt.compareTo(b.createdAt),
      SortField.updatedAt => (a.updatedAt ?? a.createdAt).compareTo(
        b.updatedAt ?? b.createdAt,
      ),
      SortField.category => a.category.name.compareTo(b.category.name),
      SortField.streaming =>
        a.streaming.isNotEmpty && b.streaming.isNotEmpty
            ? a.streaming.first.service.name.compareTo(
                b.streaming.first.service.name,
              )
            : 0,
    };
    return sort.ascending ? result : -result;
  }

  sorted.sort(compare);
  return sorted;
}
