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
  String get clearAll => 'Clear All';

  @override
  String get newTitle => 'New Title...';

  @override
  String titleRemoved(Object title) {
    return 'The title \"$title\" has been removed successfully!';
  }

  @override
  String get actionUndone => 'Action undone!';

  @override
  String get clearAllConfirmation => 'Clear All?';

  @override
  String get noTitles => 'You do not have registered titles!';

  @override
  String get close => 'To close';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get clearAllConfirmationDialog => 'Clear All?';

  @override
  String get confirmDeleteAll => 'Are you sure you want to delete all titles?';

  @override
  String get cancel => 'Cancel';

  @override
  String get addNewTitle => 'New Title...';

  @override
  String get title => 'Title';

  @override
  String get availableOn => 'Available on...';

  @override
  String get requiredField => 'Required field!';

  @override
  String get required => 'Required!';

  @override
  String get add => 'Add';

  @override
  String get selectStreamingAndAccess => 'Select streaming and access type';

  @override
  String get back => 'Back';

  @override
  String get chooseAtLeastOne => 'Choose at least one!';

  @override
  String get confirm => 'Confirm';

  @override
  String get undo => 'Undo';

  @override
  String get selectAccess => 'Select Access';

  @override
  String get buyRent => 'Buy/Rent';

  @override
  String get free => 'Free';

  @override
  String get signature => 'Signature';

  @override
  String get selectCategory => 'Select Category';

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
  String get tvSeries => 'TV Series';

  @override
  String get shortFilm => 'Short Film';

  @override
  String get soapOpera => 'Soap Opera';

  @override
  String get special => 'Special';

  @override
  String get tvProgram => 'TV Program';

  @override
  String get videocasts => 'Videocasts';

  @override
  String get webSeries => 'Web Series';

  @override
  String get all => 'All';

  @override
  String get watched => 'Watched';

  @override
  String get unwatched => 'Unwatched';

  @override
  String get category => 'Category';

  @override
  String get streaming => 'Streaming';

  @override
  String get accessMode => 'Access Mode';

  @override
  String get creationDate => 'Creation Date';

  @override
  String get alphabeticalOrder => 'Alphabetical Order';

  @override
  String get selectStreaming => 'Select Streaming';

  @override
  String get other => 'Other';

  @override
  String get filterBy => 'Filter by:';

  @override
  String get editTitle => 'Edit Title...';

  @override
  String get save => 'Save';
}
