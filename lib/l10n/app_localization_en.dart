// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homePageTitle => 'My List';

  @override
  String completedTitles(Object completed, Object total) {
    return '$completed/$total titles watched!';
  }

  @override
  String get noTitles => 'You do not have registered titles!';

  @override
  String get search => 'Search';

  @override
  String get clearAll => 'Clear All';

  @override
  String get clearAllConfirmationDialog => 'Clear All?';

  @override
  String confirmDelete(Object title) {
    return 'Are you sure you want to delete \"$title\"?';
  }

  @override
  String get confirmDeleteAll => 'Are you sure you want to delete all titles?';

  @override
  String get delete => 'Delete';

  @override
  String get confirmDeleteTitle => 'Confirm before deleting';

  @override
  String get confirmDeleteSubtitle =>
      'Show a confirmation dialog before removing a title';

  @override
  String titleRemoved(Object title) {
    return 'The title \"$title\" has been removed successfully!';
  }

  @override
  String get undo => 'Undo';

  @override
  String get edit => 'Edit';

  @override
  String get editTitle => 'Edit Title...';

  @override
  String get addNewTitle => 'New Title...';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get back => 'Back';

  @override
  String get confirm => 'Confirm';

  @override
  String get required => 'Required!';

  @override
  String get requiredField => 'Required field!';

  @override
  String get chooseAtLeastOne => 'Choose at least one!';

  @override
  String get title => 'Title';

  @override
  String get category => 'Category';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get availableOn => 'Available on...';

  @override
  String get streaming => 'Streaming';

  @override
  String get selectStreaming => 'Select Streaming';

  @override
  String get accessMode => 'Access Mode';

  @override
  String get selectAccess => 'Select Access';

  @override
  String get all => 'All';

  @override
  String get watched => 'Watched';

  @override
  String get alphabeticalOrder => 'Alphabetical Order';

  @override
  String get creationDate => 'Creation Date';

  @override
  String get updatedAt => 'Last updated';

  @override
  String get buyRent => 'Buy/Rent';

  @override
  String get free => 'Free';

  @override
  String get signature => 'Subscription';

  @override
  String get other => 'Other';

  @override
  String get anime => 'Anime';

  @override
  String get cartoon => 'Cartoon';

  @override
  String get documentary => 'Documentary';

  @override
  String get filmedTheater => 'Filmed Theater';

  @override
  String get movie => 'Movie';

  @override
  String get machinima => 'Machinima';

  @override
  String get miniseries => 'Miniseries';

  @override
  String get animatedComic => 'Animated Comic';

  @override
  String get musicVideo => 'Music Video';

  @override
  String get realityShow => 'Reality Show';

  @override
  String get serial => 'Serial';

  @override
  String get shortFilm => 'Short Film';

  @override
  String get soapOpera => 'Soap Opera';

  @override
  String get special => 'Special';

  @override
  String get tvSeries => 'TV Series';

  @override
  String get tvProgram => 'TV Program';

  @override
  String get videocasts => 'Videocasts';

  @override
  String get webSeries => 'Web Series';

  @override
  String get appSettings => 'Settings';

  @override
  String get appTheme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get behavior => 'Behavior';

  @override
  String get backupSecurity => 'Data Security';

  @override
  String get backupSecurityInfo =>
      'The app saves everything locally. Use the options below to avoid losing data when switching devices.';

  @override
  String get backupExport => 'Export your data';

  @override
  String get downloadBackup => 'Download backup';

  @override
  String get shareBackup => 'Share backup';

  @override
  String get importBackup => 'Load backup';

  @override
  String get replaceData => 'Replaces all current data';

  @override
  String get confirmImport => 'Confirm Import';

  @override
  String get confirmImportMsg =>
      'This will erase all current data and replace it with the backup. Continue?';

  @override
  String get backupSaved => 'Backup saved!';

  @override
  String get backupShared => 'Backup shared!';

  @override
  String get backupError => 'Error generating backup';

  @override
  String get importSuccess => 'Backup imported successfully!';

  @override
  String get importError => 'Error importing backup';
}
