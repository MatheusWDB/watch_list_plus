import 'package:flutter/material.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';

enum FilterEnum {
  all,
  category,
  streaming,
  access;

  String displayNameTranslate(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return switch (this) {
      FilterEnum.all => t.all,
      FilterEnum.category => t.category,
      FilterEnum.streaming => t.streaming,
      FilterEnum.access => t.accessMode,
    };
  }
}
