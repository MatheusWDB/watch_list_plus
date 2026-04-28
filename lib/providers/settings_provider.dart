import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist_plus/enums/sort_enum.dart';
import 'package:watchlist_plus/models/app_settings.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  static const _themeModeKey = 'theme_mode';
  static const _sortFieldKey = 'sort_field';
  static const _ascendingKey = 'sort_ascending';
  static const _confirmDeleteKey = 'confirm_delete';

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  AppSettings build() {
    _loadFromStorage();
    return const AppSettings();
  }

  Future<void> _loadFromStorage() async {
    final prefs = await _prefs;

    state = state.copyWith(
      themeMode: () {
        final idx = prefs.getInt(_themeModeKey);
        return idx != null ? ThemeMode.values[idx] : state.themeMode;
      }(),
      sortField: () {
        final idx = prefs.getInt(_sortFieldKey);
        return idx != null ? SortField.values[idx] : state.sortField;
      }(),
      ascending: prefs.getBool(_ascendingKey) ?? state.ascending,
      confirmDelete: prefs.getBool(_confirmDeleteKey) ?? state.confirmDelete,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    (await _prefs).setInt(_themeModeKey, mode.index);
  }

  Future<void> setSortField(SortField field) async {
    state = state.copyWith(sortField: field);
    (await _prefs).setInt(_sortFieldKey, field.index);
  }

  Future<void> setAscending(bool value) async {
    state = state.copyWith(ascending: value);
    (await _prefs).setBool(_ascendingKey, value);
  }

  Future<void> setConfirmDelete(bool value) async {
    state = state.copyWith(confirmDelete: value);
    (await _prefs).setBool(_confirmDeleteKey, value);
  }
}
