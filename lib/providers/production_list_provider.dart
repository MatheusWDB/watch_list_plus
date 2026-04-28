import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/repositories/production_repository.dart';

part 'production_list_provider.g.dart';

@riverpod
ProductionRepository productionRepository(Ref _) => ProductionRepository();

@riverpod
class ProductionList extends _$ProductionList {
  late final ProductionRepository _repo;

  @override
  Future<List<Production>> build() async {
    _repo = ref.watch(productionRepositoryProvider);
    return _repo.findAll();
  }

  Future<void> add(Production production) async {
    final current = state.value ?? [];
    state = await AsyncValue.guard(() async {
      final inserted = await _repo.insert(production);
      return [...current, inserted];
    });
  }

  Future<void> updateProduction(Production production) async {
    final current = state.value ?? [];
    state = await AsyncValue.guard(() async {
      await _repo.update(production);
      return current
          .map((p) => p.id == production.id ? production : p)
          .toList();
    });
  }

  Future<void> remove(int id) async {
    final current = state.value ?? [];
    state = await AsyncValue.guard(() async {
      await _repo.delete(id);
      return current.where((p) => p.id != id).toList();
    });
  }

  Future<void> toggleWatched(Production production) async {
    await updateProduction(production.copyWith(watched: !production.watched));
  }

  Future<void> replaceAll(List<Production> productions) async {
    state = await AsyncValue.guard(() async {
      await _repo.deleteAll();
      final inserted = await Future.wait(
        productions.map((p) => _repo.insert(p)),
      );
      return inserted;
    });
  }
}
