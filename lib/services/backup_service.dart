import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/repositories/production_repository.dart';

class BackupService {
  final _repo = ProductionRepository();

  static const _backupPrefix = 'watchlist_backup';

  Future<void> saveBackup() async {
    final file = await _buildBackupFile();
    final bytes = await file.readAsBytes();
    final stamp = _stamp();

    final path = await FileSaver.instance.saveAs(
      name: '${_backupPrefix}_$stamp',
      bytes: bytes,
      fileExtension: 'dat',
      mimeType: MimeType.other,
    );

    if (path == null || path.isEmpty) throw const _BackupCancelled();
  }

  Future<void> shareBackup() async {
    final file = await _buildBackupFile();

    final result = await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], text: 'WatchList+ backup'),
    );

    if (result.status == ShareResultStatus.dismissed) {
      throw const _BackupCancelled();
    }
  }

  Future<List<Production>?> importBackup() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['dat'],
    );

    final path = result?.files.single.path;

    if (result == null || path == null) return null;

    final content = await File(path).readAsString();
    return Production.decodeList(content);
  }

  Future<File> _buildBackupFile() async {
    final productions = await _repo.findAll();
    final content = Production.encodeList(productions);

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${_backupPrefix}_${_stamp()}.dat');
    await file.writeAsString(content);
    return file;
  }

  String _stamp() =>
      DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
}

class _BackupCancelled implements Exception {
  const _BackupCancelled();
}
