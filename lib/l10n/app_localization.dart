import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_en.dart';
import 'app_localization_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @homePageTitle.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get homePageTitle;

  /// No description provided for @completedTitles.
  ///
  /// In en, this message translates to:
  /// **'{completed}/{total} titles watched!'**
  String completedTitles(Object completed, Object total);

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @newTitle.
  ///
  /// In en, this message translates to:
  /// **'New Title...'**
  String get newTitle;

  /// No description provided for @titleRemoved.
  ///
  /// In en, this message translates to:
  /// **'The title \"{title}\" has been removed successfully!'**
  String titleRemoved(Object title);

  /// No description provided for @actionUndone.
  ///
  /// In en, this message translates to:
  /// **'Action undone!'**
  String get actionUndone;

  /// No description provided for @clearAllConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Clear All?'**
  String get clearAllConfirmation;

  /// No description provided for @noTitles.
  ///
  /// In en, this message translates to:
  /// **'You do not have registered titles!'**
  String get noTitles;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'To close'**
  String get close;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @clearAllConfirmationDialog.
  ///
  /// In en, this message translates to:
  /// **'Clear All?'**
  String get clearAllConfirmationDialog;

  /// No description provided for @confirmDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all titles?'**
  String get confirmDeleteAll;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @addNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New Title...'**
  String get addNewTitle;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @availableOn.
  ///
  /// In en, this message translates to:
  /// **'Available on...'**
  String get availableOn;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field!'**
  String get requiredField;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required!'**
  String get required;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @selectStreamingAndAccess.
  ///
  /// In en, this message translates to:
  /// **'Select streaming and access type'**
  String get selectStreamingAndAccess;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @chooseAtLeastOne.
  ///
  /// In en, this message translates to:
  /// **'Choose at least one!'**
  String get chooseAtLeastOne;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @selectAccess.
  ///
  /// In en, this message translates to:
  /// **'Select Access'**
  String get selectAccess;

  /// No description provided for @buyRent.
  ///
  /// In en, this message translates to:
  /// **'Buy/Rent'**
  String get buyRent;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @signature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get signature;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @anime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get anime;

  /// No description provided for @cartoon.
  ///
  /// In en, this message translates to:
  /// **'Cartoon'**
  String get cartoon;

  /// No description provided for @documentary.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get documentary;

  /// No description provided for @filmedTheater.
  ///
  /// In en, this message translates to:
  /// **'Filmed Theater'**
  String get filmedTheater;

  /// No description provided for @movie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get movie;

  /// No description provided for @machinima.
  ///
  /// In en, this message translates to:
  /// **'Machinima'**
  String get machinima;

  /// No description provided for @miniseries.
  ///
  /// In en, this message translates to:
  /// **'Miniseries'**
  String get miniseries;

  /// No description provided for @animatedComic.
  ///
  /// In en, this message translates to:
  /// **'Animated Comic'**
  String get animatedComic;

  /// No description provided for @musicVideo.
  ///
  /// In en, this message translates to:
  /// **'Music Video'**
  String get musicVideo;

  /// No description provided for @realityShow.
  ///
  /// In en, this message translates to:
  /// **'Reality Show'**
  String get realityShow;

  /// No description provided for @serial.
  ///
  /// In en, this message translates to:
  /// **'Serial'**
  String get serial;

  /// No description provided for @tvSeries.
  ///
  /// In en, this message translates to:
  /// **'TV Series'**
  String get tvSeries;

  /// No description provided for @shortFilm.
  ///
  /// In en, this message translates to:
  /// **'Short Film'**
  String get shortFilm;

  /// No description provided for @soapOpera.
  ///
  /// In en, this message translates to:
  /// **'Soap Opera'**
  String get soapOpera;

  /// No description provided for @special.
  ///
  /// In en, this message translates to:
  /// **'Special'**
  String get special;

  /// No description provided for @tvProgram.
  ///
  /// In en, this message translates to:
  /// **'TV Program'**
  String get tvProgram;

  /// No description provided for @videocasts.
  ///
  /// In en, this message translates to:
  /// **'Videocasts'**
  String get videocasts;

  /// No description provided for @webSeries.
  ///
  /// In en, this message translates to:
  /// **'Web Series'**
  String get webSeries;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @watched.
  ///
  /// In en, this message translates to:
  /// **'Watched'**
  String get watched;

  /// No description provided for @unwatched.
  ///
  /// In en, this message translates to:
  /// **'Unwatched'**
  String get unwatched;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @streaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get streaming;

  /// No description provided for @accessMode.
  ///
  /// In en, this message translates to:
  /// **'Access Mode'**
  String get accessMode;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation Date'**
  String get creationDate;

  /// No description provided for @alphabeticalOrder.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical Order'**
  String get alphabeticalOrder;

  /// No description provided for @selectStreaming.
  ///
  /// In en, this message translates to:
  /// **'Select Streaming'**
  String get selectStreaming;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @filterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter by:'**
  String get filterBy;

  /// No description provided for @editTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Title...'**
  String get editTitle;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
