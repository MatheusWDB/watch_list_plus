import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/components/production_card.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/providers/search_provider.dart';
import 'package:watchlist_plus/providers/sort_provider.dart';
import 'package:watchlist_plus/tabs/dashboard/empty_state.dart';
import 'package:watchlist_plus/tabs/dashboard/filter_bar.dart';
import 'package:watchlist_plus/tabs/dashboard/sort_button.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final sort = ref.watch(sortConfigProvider);
    final filter = ref.watch(activeFilterProvider);
    final List<Production> shown = ref
        .watch(sortedProductionsProvider)
        .where((p) => !p.watched)
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t.search,
                    prefixIcon: const Icon(Icons.search_rounded, size: 20),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    filled: true,
                    fillColor: colors.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: ref.read(searchQueryProvider.notifier).setQuery,
                ),
              ),
              SortButton(sort: sort),
            ],
          ),
        ),

        FilterBar(filter: filter),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Consumer(
              builder: (_, ref, _) {
                final all = ref.watch(productionListProvider).value ?? [];
                return Text(
                  t.completedTitles(
                    all.where((p) => p.watched).length,
                    all.length,
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                );
              },
            ),
          ),
        ),

        Expanded(
          child: shown.isEmpty
              ? EmptyState(message: t.noTitles)
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: shown.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => ProductionCard(production: shown[i]),
                ),
        ),
      ],
    );
  }
}
