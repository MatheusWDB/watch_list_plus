import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/providers/settings_provider.dart';
import 'package:watchlist_plus/screens/add_or_update_screen.dart';

class ProductionCard extends ConsumerWidget {
  final Production production;

  const ProductionCard({required this.production, super.key});

  static const Map<StreamingEnum, Color> _serviceColors = {
    StreamingEnum.apple: Color(0xFF999999),
    StreamingEnum.crunchy: Color(0xFFFF640A),
    StreamingEnum.disney: Color(0xFF0CA8B8),
    StreamingEnum.globo: Color(0xFFEE3E2F),
    StreamingEnum.max: Color(0xFF536DFE),
    StreamingEnum.netflix: Color(0xFFE90916),
    StreamingEnum.paramount: Color(0xFF0163FF),
    StreamingEnum.pluto: Color(0xFFFEF21B),
    StreamingEnum.prime: Color(0xFF0578FF),
    StreamingEnum.sbt: Color(0xFF00A859),
    StreamingEnum.telecine: Color(0xFF7986CB),
    StreamingEnum.youtube: Color(0xFFFF6D00),
  };

  static Color _serviceColor(StreamingEnum service) =>
      _serviceColors[service] ?? const Color(0xFF607D8B);

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    HapticFeedback.mediumImpact();
    final t = AppLocalizations.of(context)!;
    final settings = ref.read(settingsProvider);

    if (settings.confirmDelete) {
      final confirmed = await _showDeleteDialog(context, t);
      if (confirmed != true) return;
    }

    if (!context.mounted) return;
    ref.read(productionListProvider.notifier).remove(production.id!);

    if (!context.mounted) return;
    _showUndoSnackbar(context, ref, t);
  }

  void _edit(BuildContext context) {
    HapticFeedback.selectionClick();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddOrUpdateScreen(production: production),
      ),
    );
  }

  void _onToggleWatched(WidgetRef ref) {
    HapticFeedback.mediumImpact();
    ref.read(productionListProvider.notifier).toggleWatched(production);
  }

  Future<bool?> _showDeleteDialog(BuildContext context, AppLocalizations t) =>
      showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(t.delete),
          content: Text(t.confirmDelete(production.title)),
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
              child: Text(t.delete),
            ),
          ],
        ),
      );

  void _showUndoSnackbar(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations t,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        content: Text(t.titleRemoved(production.title)),
        action: SnackBarAction(
          label: t.undo,
          onPressed: () =>
              ref.read(productionListProvider.notifier).add(production),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Slidable(
      key: ValueKey(production.id),
      startActionPane: ActionPane(
        extentRatio: 0.30,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => _delete(context, ref),
            backgroundColor: colors.error,
            foregroundColor: colors.onError,
            icon: Icons.delete_outline_rounded,
            label: t.delete,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.30,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _edit(context),
            backgroundColor: colors.tertiary,
            foregroundColor: colors.onTertiary,
            icon: Icons.edit_outlined,
            label: t.edit,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(12),
            ),
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _edit(context),
          onLongPress: () => _onToggleWatched(ref),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _onToggleWatched(ref),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: production.watched
                          ? colors.primary
                          : colors.surfaceContainerHighest,
                      border: Border.all(
                        color: production.watched
                            ? colors.primary
                            : colors.outline,
                        width: 1.5,
                      ),
                    ),
                    child: production.watched
                        ? Icon(
                            Icons.check_rounded,
                            size: 20,
                            color: colors.onPrimary,
                          )
                        : Icon(
                            Icons.tv_outlined,
                            size: 18,
                            color: colors.onSurfaceVariant,
                          ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        production.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: texts.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: production.watched
                              ? TextDecoration.lineThrough
                              : null,
                          color: production.watched
                              ? colors.onSurface.withValues(alpha: 0.5)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        production.category.displayNameTranslate(context),
                        style: texts.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: colors.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      if (production.streaming.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: production.streaming.map((s) {
                            final serviceColor = _serviceColor(s.service);
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: serviceColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: serviceColor.withValues(alpha: 0.4),
                                ),
                              ),
                              child: Text(
                                '${s.service.displayNameTranslate(context)} · ${s.access.displayNameTranslate(context)}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: serviceColor.withValues(
                                    alpha: production.watched ? 0.5 : 1.0,
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
