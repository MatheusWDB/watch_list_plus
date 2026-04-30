import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/enums/access_enum.dart';
import 'package:watchlist_plus/enums/category_enum.dart';
import 'package:watchlist_plus/enums/filter_enum.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/providers/search_provider.dart';
import 'package:watchlist_plus/tabs/dashboard/dropdown_chip.dart';

class FilterBar extends ConsumerWidget {
  final ({
    FilterEnum filter,
    CategoryEnum category,
    StreamingEnum streaming,
    AccessEnum access,
  })
  filter;

  const FilterBar({required this.filter, super.key});

  String _activeLabel(BuildContext context) => switch (filter.filter) {
    FilterEnum.category => filter.category.displayNameTranslate(context),
    FilterEnum.streaming => filter.streaming.displayNameTranslate(context),
    FilterEnum.access => filter.access.displayNameTranslate(context),
    _ => '',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final notifier = ref.read(activeFilterProvider.notifier);

    final bool isFiltered = filter.filter != FilterEnum.all;

    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(t.all),
              selected: !isFiltered,
              onSelected: (_) => notifier.reset(),
              showCheckmark: false,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DropdownChip<CategoryEnum>(
              label: filter.filter == FilterEnum.category
                  ? _activeLabel(context)
                  : t.category,
              isActive: filter.filter == FilterEnum.category,
              values: CategoryEnum.values
                  .where((c) => c != CategoryEnum.absent)
                  .toList(),
              labelOf: (c) => c.displayNameTranslate(context),
              onSelected: notifier.setCategory,
              onClear: notifier.reset,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DropdownChip<StreamingEnum>(
              label: filter.filter == FilterEnum.streaming
                  ? _activeLabel(context)
                  : t.streaming,
              isActive: filter.filter == FilterEnum.streaming,
              values: StreamingEnum.values
                  .where((s) => s != StreamingEnum.absent)
                  .toList(),
              labelOf: (s) => s.displayNameTranslate(context),
              onSelected: notifier.setStreaming,
              onClear: notifier.reset,
            ),
          ),

          DropdownChip<AccessEnum>(
            label: filter.filter == FilterEnum.access
                ? _activeLabel(context)
                : t.accessMode,
            isActive: filter.filter == FilterEnum.access,
            values: AccessEnum.values
                .where((a) => a != AccessEnum.absent)
                .toList(),
            labelOf: (a) => a.displayNameTranslate(context),
            onSelected: notifier.setAccess,
            onClear: notifier.reset,
          ),
        ],
      ),
    );
  }
}
