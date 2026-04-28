import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watchlist_plus/enums/sort_enum.dart';
import 'package:watchlist_plus/providers/settings_provider.dart';

part 'sort_provider.g.dart';

@riverpod
class SortConfig extends _$SortConfig {
  @override
  ({SortField field, bool ascending}) build() {
    final settings = ref.watch(settingsProvider);
    return (field: settings.sortField, ascending: settings.ascending);
  }

  void changeField(SortField field) {
    state = (field: field, ascending: state.ascending);
  }

  void toggleDirection() {
    state = (field: state.field, ascending: !state.ascending);
  }
}
