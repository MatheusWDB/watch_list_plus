import 'package:flutter/material.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';

enum SortField {
  title,
  createdAt,
  updatedAt,
  category,
  streaming;

  String displayName(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return switch (this) {
      SortField.title => t.alphabeticalOrder,
      SortField.createdAt => t.creationDate,
      SortField.updatedAt => t.updatedAt,
      SortField.category => t.category,
      SortField.streaming => t.streaming,
    };
  }
}