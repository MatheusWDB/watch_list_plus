import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/providers/search_provider.dart';
import 'package:watchlist_plus/screens/add_or_update_screen.dart';
import 'package:watchlist_plus/screens/settings/settings_screen.dart';
import 'package:watchlist_plus/tabs/dashboard/dashboard_tab.dart';
import 'package:watchlist_plus/tabs/watched_tab.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _tabIndex = 0;

  void _onTabChanged(int index) {
    HapticFeedback.selectionClick();
    ref.read(searchQueryProvider.notifier).clear();
    setState(() => _tabIndex = index);
  }

  void _onPressedFAB() {
    HapticFeedback.selectionClick();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddOrUpdateScreen()),
    );
  }

  Future<void> _confirmClearAll(
    BuildContext context,
    AppLocalizations t,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.clearAllConfirmationDialog),
        content: Text(t.confirmDeleteAll),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(t.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.clearAll),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      ref.read(productionListProvider.notifier).replaceAll([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final asyncList = ref.watch(productionListProvider);

    final String title = _tabIndex == 0 ? t.homePageTitle : t.watched;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (_tabIndex == 0)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined),
              tooltip: t.clearAll,
              onPressed: asyncList.maybeWhen(
                data: (list) =>
                    list.isEmpty ? null : () => _confirmClearAll(context, t),
                orElse: () => null,
              ),
            ),

          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: t.appSettings,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),

      body: switch (_tabIndex) {
        0 => const DashboardTab(),
        _ => const WatchedTab(),
      },

      floatingActionButton: _tabIndex == 0
          ? FloatingActionButton(
              onPressed: () => _onPressedFAB(),
              child: const Icon(Icons.add_rounded),
            )
          : null,

      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: _onTabChanged,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: t.homePageTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.done_all_outlined),
            selectedIcon: const Icon(Icons.done_all_rounded),
            label: t.watched,
          ),
        ],
      ),
    );
  }
}
