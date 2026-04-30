import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/components/production_card.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/tabs/dashboard/empty_state.dart';

class WatchedTab extends ConsumerWidget {
  const WatchedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;

    final List<Production> watched =
        (ref.watch(productionListProvider).value ?? [])
            .where((p) => p.watched)
            .toList();

    if (watched.isEmpty) {
      return EmptyState(message: t.noTitles, icon: Icons.done_all_rounded);
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: watched.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, i) => ProductionCard(production: watched[i]),
    );
  }
}
