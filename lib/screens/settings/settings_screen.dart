import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';
import 'package:watchlist_plus/providers/settings_provider.dart';
import 'package:watchlist_plus/screens/settings/section_header.dart';
import 'package:watchlist_plus/services/backup_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<bool?> _confirmImportDialog(
    BuildContext context,
    AppLocalizations t,
  ) => showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(t.confirmImport),
      content: Text(t.confirmImportMsg),
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
          child: Text(t.confirm),
        ),
      ],
    ),
  );

  void _showSnack(BuildContext context, String message, {bool error = false}) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: error ? Theme.of(context).colorScheme.error : null,
        ),
      );
  }

  void _showExportSheet(BuildContext context, AppLocalizations t) {
    final backup = BackupService();

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.folder_outlined),
              title: Text(t.downloadBackup),
              onTap: () => _onDownloadBackup(sheetCtx, backup, context, t),
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: Text(t.shareBackup),
              onTap: () => _onShareBackup(sheetCtx, backup, context, t),
            ),
          ],
        ),
      ),
    );
  }

  void _onDownloadBackup(
    BuildContext sheetCtx,
    BackupService backup,
    BuildContext context,
    AppLocalizations t,
  ) async {
    Navigator.pop(sheetCtx);
    try {
      await backup.saveBackup();
      if (context.mounted) _showSnack(context, t.backupSaved);
    } catch (_) {}
  }

  void _onShareBackup(
    BuildContext sheetCtx,
    BackupService backup,
    BuildContext context,
    AppLocalizations t,
  ) async {
    Navigator.pop(sheetCtx);
    try {
      await backup.shareBackup();
      if (context.mounted) _showSnack(context, t.backupShared);
    } catch (_) {}
  }

  Future<void> _handleImport(
    BuildContext context,
    AppLocalizations t,
    WidgetRef ref,
  ) async {
    try {
      final List<Production>? productions = await BackupService()
          .importBackup();

      if (productions == null) return;
      if (!context.mounted) return;

      final confirmed = await _confirmImportDialog(context, t);
      if (confirmed != true) return;

      await ref.read(productionListProvider.notifier).replaceAll(productions);
      if (context.mounted) _showSnack(context, t.importSuccess);
    } catch (_) {
      if (context.mounted) _showSnack(context, t.importError, error: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.appSettings)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          SectionHeader(label: t.appTheme),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.brightness_auto_outlined),
                  label: Text(t.themeSystem),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode_outlined),
                  label: Text(t.themeLight),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode_outlined),
                  label: Text(t.themeDark),
                ),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (s) => notifier.setThemeMode(s.first),
            ),
          ),

          const SizedBox(height: 8),
          const Divider(),

          SectionHeader(label: t.behavior),
          SwitchListTile(
            secondary: const Icon(Icons.warning_amber_rounded),
            title: Text(t.confirmDeleteTitle),
            subtitle: Text(t.confirmDeleteSubtitle),
            value: settings.confirmDelete,
            onChanged: notifier.setConfirmDelete,
          ),

          const Divider(),

          SectionHeader(label: t.backupSecurity),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              t.backupSecurityInfo,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.upload_outlined),
                  title: Text(t.backupExport),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showExportSheet(context, t),
                ),
                const Divider(height: 1, indent: 16),
                ListTile(
                  leading: const Icon(Icons.download_outlined),
                  title: Text(t.importBackup),
                  subtitle: Text(t.replaceData),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _handleImport(context, t, ref),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
