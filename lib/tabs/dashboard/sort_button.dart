import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/enums/sort_enum.dart';
import 'package:watchlist_plus/providers/settings_provider.dart';
import 'package:watchlist_plus/providers/sort_provider.dart';

class SortButton extends ConsumerWidget {
  final ({SortField field, bool ascending}) sort;

  const SortButton({required this.sort, super.key});

  void _onSelected(SortField field, WidgetRef ref) {
    ref.read(sortConfigProvider.notifier).changeField(field);
    ref.read(settingsProvider.notifier).setSortField(field);
  }

  void _toggleDirection(WidgetRef ref) {
    ref.read(sortConfigProvider.notifier).toggleDirection();
    ref.read(settingsProvider.notifier).setAscending(!sort.ascending);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopupMenuButton<SortField>(
      initialValue: sort.field,
      tooltip: '',
      onSelected: (field) => _onSelected(field, ref),
      itemBuilder: (_) => SortField.values
          .map(
            (f) => PopupMenuItem(
              value: f,
              child: Row(
                spacing: 12,
                children: [
                  if (sort.field == f)
                    Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: colorScheme.primary,
                    )
                  else
                    const SizedBox(width: 16),
                  Text(f.displayName(context)),
                ],
              ),
            ),
          )
          .toList(),
      child: IconButton.filled(
        onPressed: () => _toggleDirection(ref),
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceContainerHighest,
          foregroundColor: colorScheme.onSurface,
        ),
        icon: Icon(
          sort.ascending
              ? Icons.arrow_upward_rounded
              : Icons.arrow_downward_rounded,
          size: 20,
        ),
        tooltip: sort.field.displayName(context),
      ),
    );
  }
}
