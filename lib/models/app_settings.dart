import 'package:flutter/material.dart';
import 'package:watchlist_plus/enums/sort_enum.dart';

class AppSettings {
  final ThemeMode themeMode;
  final SortField sortField;
  final bool ascending;
  final bool confirmDelete;

  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.sortField = SortField.title,
    this.ascending = true,
    this.confirmDelete = true,
  });

  AppSettings copyWith({
    ThemeMode? themeMode,
    SortField? sortField,
    bool? ascending,
    bool? confirmDelete,
  }) => AppSettings(
    themeMode: themeMode ?? this.themeMode,
    sortField: sortField ?? this.sortField,
    ascending: ascending ?? this.ascending,
    confirmDelete: confirmDelete ?? this.confirmDelete,
  );
}
