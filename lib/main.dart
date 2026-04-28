import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/l10n/l10n.dart';
import 'package:watchlist_plus/providers/settings_provider.dart';
import 'package:watchlist_plus/screens/home_screen.dart';
import 'package:watchlist_plus/themes/app_themes.dart';

void main() {
  runApp(const ProviderScope(child: WatchlistApp()));
}

class WatchlistApp extends ConsumerWidget {
  const WatchlistApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.homePageTitle,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: settings.themeMode,
      home: const HomeScreen(),
    );
  }
}
