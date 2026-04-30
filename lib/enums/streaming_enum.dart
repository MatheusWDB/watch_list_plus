import 'package:flutter/material.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';

enum StreamingEnum {
  absent(''),
  apple('Apple TV+'),
  crunchy('Crunchyroll'),
  disney('Disney+'),
  globo('Globoplay'),
  max('Max'),
  netflix('Netflix'),
  paramount('Paramount+'),
  pluto('Pluto TV'),
  prime('Prime Video'),
  sbt('SBT+'),
  telecine('Telecine'),
  youtube('YouTube'),
  other('');

  String displayNameTranslate(BuildContext context) {
    switch (this) {
      case StreamingEnum.absent:
        return AppLocalizations.of(context)!.selectStreaming;
      case StreamingEnum.other:
        return AppLocalizations.of(context)!.other;
      default:
        return displayName;
    }
  }

  final String displayName;

  const StreamingEnum(this.displayName);

  @override
  String toString() => name;
}
