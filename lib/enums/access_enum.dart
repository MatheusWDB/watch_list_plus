import 'package:flutter/material.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';

enum AccessEnum {
  absent,
  buyRent,
  free,
  signature;

  String displayNameTranslate(BuildContext context) {
    switch (this) {
      case AccessEnum.absent:
        return AppLocalizations.of(context)!.selectAccess;
      case AccessEnum.buyRent:
        return AppLocalizations.of(context)!.buyRent;
      case AccessEnum.free:
        return AppLocalizations.of(context)!.free;
      case AccessEnum.signature:
        return AppLocalizations.of(context)!.signature;
    }
  }

  @override
  String toString() => name;
}
