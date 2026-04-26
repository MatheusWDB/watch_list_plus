import 'package:flutter/material.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';

enum SortEnum {
  creationDate,
  watched,
  alphabeticalOrder,
  category,
  streaming,
  access;

  String displayNameTranslate(BuildContext context) {
    switch (this) {
      case SortEnum.creationDate:
        return AppLocalizations.of(context)!.creationDate;
      case SortEnum.watched:
        return AppLocalizations.of(context)!.watched;
      case SortEnum.alphabeticalOrder:
        return AppLocalizations.of(context)!.alphabeticalOrder;
      case SortEnum.category:
        return AppLocalizations.of(context)!.category;
      case SortEnum.streaming:
        return AppLocalizations.of(context)!.streaming;
      case SortEnum.access:
        return AppLocalizations.of(context)!.accessMode;
    }
  }

  @override
  String toString() => name;
}
