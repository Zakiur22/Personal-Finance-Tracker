// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ADD`
  String get addCategoryBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'addCategoryBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get addCategoryBottomSheetButtonTextCancel {
    return Intl.message(
      'CANCEL',
      name: 'addCategoryBottomSheetButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  /// `Add New {type} Category`
  String addCategoryBottomSheetHeadingText(Object type) {
    return Intl.message(
      'Add New $type Category',
      name: 'addCategoryBottomSheetHeadingText',
      desc: '',
      args: [type],
    );
  }

  /// `Category Name`
  String get addCategoryBottomSheetLabelTextCategoryName {
    return Intl.message(
      'Category Name',
      name: 'addCategoryBottomSheetLabelTextCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Be Thrifty Today`
  String get appName {
    return Intl.message(
      'Be Thrifty Today',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categoriesScreenAppBarTitle {
    return Intl.message(
      'Categories',
      name: 'categoriesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get categoriesScreenButtonTextAddNew {
    return Intl.message(
      'Add New',
      name: 'categoriesScreenButtonTextAddNew',
      desc: '',
      args: [],
    );
  }

  /// `The category has been successfully deleted`
  String get categoriesScreenSnackbarTextDeleteMessage {
    return Intl.message(
      'The category has been successfully deleted',
      name: 'categoriesScreenSnackbarTextDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get categoriesScreenSnackbarTextResetCategoriesAction {
    return Intl.message(
      'Yes',
      name: 'categoriesScreenSnackbarTextResetCategoriesAction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset all categories to the original?`
  String get categoriesScreenSnackbarTextResetCategoriesConfirmation {
    return Intl.message(
      'Are you sure you want to reset all categories to the original?',
      name: 'categoriesScreenSnackbarTextResetCategoriesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `All categories have been reset successfully`
  String get categoriesScreenSnackbarTextResetCategoriesSuccess {
    return Intl.message(
      'All categories have been reset successfully',
      name: 'categoriesScreenSnackbarTextResetCategoriesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get categoriesScreenTabBarTextExpense {
    return Intl.message(
      'Expense',
      name: 'categoriesScreenTabBarTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get categoriesScreenTabBarTextIncome {
    return Intl.message(
      'Income',
      name: 'categoriesScreenTabBarTextIncome',
      desc: '',
      args: [],
    );
  }

  /// `{category, select, Automobile {Automobile} Awards {Awards} BabyCare {Baby Care} Bonus {Bonus} Books {Books} Charity {Charity} Clothing {Clothing} Drinks {Drinks} Education {Education} Electronics {Electronics} Entertainment {Entertainment} Food {Food} Freelance {Freelance} FriendsFamily {Friends & Family} Gifts {Gifts} Grants {Grants} Groceries {Groceries} Health {Health} Hobbies {Hobbies} Insurance {Insurance} Interest {Interest} Investments {Investments} Laundry {Laundry} Lottery {Lottery} Mobile {Mobile} Office {Office} Others {Others} Pets {Pets} Refunds {Refunds} Rent {Rent} Salary {Salary} Sale {Sale} SalonSpa {Salon & Spa} Shopping {Shopping} Tax {Tax} Transportation {Transportation} Travel {Travel} Utilities {Utilities} other {{category}}}`
  String categoryName(Object category) {
    return Intl.select(
      category,
      {
        'Automobile': 'Automobile',
        'Awards': 'Awards',
        'BabyCare': 'Baby Care',
        'Bonus': 'Bonus',
        'Books': 'Books',
        'Charity': 'Charity',
        'Clothing': 'Clothing',
        'Drinks': 'Drinks',
        'Education': 'Education',
        'Electronics': 'Electronics',
        'Entertainment': 'Entertainment',
        'Food': 'Food',
        'Freelance': 'Freelance',
        'FriendsFamily': 'Friends & Family',
        'Gifts': 'Gifts',
        'Grants': 'Grants',
        'Groceries': 'Groceries',
        'Health': 'Health',
        'Hobbies': 'Hobbies',
        'Insurance': 'Insurance',
        'Interest': 'Interest',
        'Investments': 'Investments',
        'Laundry': 'Laundry',
        'Lottery': 'Lottery',
        'Mobile': 'Mobile',
        'Office': 'Office',
        'Others': 'Others',
        'Pets': 'Pets',
        'Refunds': 'Refunds',
        'Rent': 'Rent',
        'Salary': 'Salary',
        'Sale': 'Sale',
        'SalonSpa': 'Salon & Spa',
        'Shopping': 'Shopping',
        'Tax': 'Tax',
        'Transportation': 'Transportation',
        'Travel': 'Travel',
        'Utilities': 'Utilities',
        'other': '$category',
      },
      name: 'categoryName',
      desc: '',
      args: [category],
    );
  }

  /// `Currencies`
  String get currenciesScreenAppBarTitle {
    return Intl.message(
      'Currencies',
      name: 'currenciesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get currenciesScreenSnackbarTextResetCurrenciesAction {
    return Intl.message(
      'Yes',
      name: 'currenciesScreenSnackbarTextResetCurrenciesAction',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset all currencies to the original?`
  String get currenciesScreenSnackbarTextResetCurrenciesConfirmation {
    return Intl.message(
      'Are you sure you want to reset all currencies to the original?',
      name: 'currenciesScreenSnackbarTextResetCurrenciesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `All currencies have been reset successfully`
  String get currenciesScreenSnackbarTextResetCurrenciesSuccess {
    return Intl.message(
      'All currencies have been reset successfully',
      name: 'currenciesScreenSnackbarTextResetCurrenciesSuccess',
      desc: '',
      args: [],
    );
  }

  /// `What's your currency?`
  String get currencySetupTextHeadline {
    return Intl.message(
      'What\'s your currency?',
      name: 'currencySetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `No, I don't want to leave!`
  String get deleteAccountDialogButtonTextCancel {
    return Intl.message(
      'No, I don\'t want to leave!',
      name: 'deleteAccountDialogButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes, delete my data!`
  String get deleteAccountDialogButtonTextDelete {
    return Intl.message(
      'Yes, delete my data!',
      name: 'deleteAccountDialogButtonTextDelete',
      desc: '',
      args: [],
    );
  }

  /// `You will lose all the data (including profile information and your transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?`
  String get deleteAccountDialogContent {
    return Intl.message(
      'You will lose all the data (including profile information and your transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?',
      name: 'deleteAccountDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete your account?`
  String get deleteAccountDialogTitle {
    return Intl.message(
      'Do you really want to delete your account?',
      name: 'deleteAccountDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `DOWNLOAD`
  String get exportBottomSheetButtonTextDownload {
    return Intl.message(
      'DOWNLOAD',
      name: 'exportBottomSheetButtonTextDownload',
      desc: '',
      args: [],
    );
  }

  /// `EXPORT`
  String get exportBottomSheetButtonTextExport {
    return Intl.message(
      'EXPORT',
      name: 'exportBottomSheetButtonTextExport',
      desc: '',
      args: [],
    );
  }

  /// `Export as CSV/JSON`
  String get exportBottomSheetHeadingText {
    return Intl.message(
      'Export as CSV/JSON',
      name: 'exportBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get exportBottomSheetLabelTextEndDate {
    return Intl.message(
      'End Date',
      name: 'exportBottomSheetLabelTextEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get exportBottomSheetLabelTextStartDate {
    return Intl.message(
      'Start Date',
      name: 'exportBottomSheetLabelTextStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Start Date must be earlier than End Date`
  String get exportBottomSheetTextDateValidationError {
    return Intl.message(
      'Start Date must be earlier than End Date',
      name: 'exportBottomSheetTextDateValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the + button below to add a new income/expense.`
  String get homeDailyNoTransactionsTextSubtitle {
    return Intl.message(
      'Tap on the + button below to add a new income/expense.',
      name: 'homeDailyNoTransactionsTextSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `This list is looking a little bit empty...`
  String get homeDailyNoTransactionsTextTitle {
    return Intl.message(
      'This list is looking a little bit empty...',
      name: 'homeDailyNoTransactionsTextTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginButtonTextGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginButtonTextGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login as Guest`
  String get loginButtonTextGuest {
    return Intl.message(
      'Login as Guest',
      name: 'loginButtonTextGuest',
      desc: '',
      args: [],
    );
  }

  /// `Be Thrifty Today is a simple and secure money management app that helps you track your income and expenses.`
  String get loginTextTagline {
    return Intl.message(
      'Be Thrifty Today is a simple and secure money management app that helps you track your income and expenses.',
      name: 'loginTextTagline',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get profileSetupButtonTextNext {
    return Intl.message(
      'NEXT',
      name: 'profileSetupButtonTextNext',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get profileSetupLabelTextEmailAddress {
    return Intl.message(
      'Email Address',
      name: 'profileSetupLabelTextEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get profileSetupLabelTextFullName {
    return Intl.message(
      'Full Name',
      name: 'profileSetupLabelTextFullName',
      desc: '',
      args: [],
    );
  }

  /// `Who are you?`
  String get profileSetupTextHeadline {
    return Intl.message(
      'Who are you?',
      name: 'profileSetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get settingsScreenHeaderTitleAccount {
    return Intl.message(
      'Account',
      name: 'settingsScreenHeaderTitleAccount',
      desc: '',
      args: [],
    );
  }

  /// `Danger Zone`
  String get settingsScreenHeaderTitleDangerZone {
    return Intl.message(
      'Danger Zone',
      name: 'settingsScreenHeaderTitleDangerZone',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get settingsScreenHeaderTitlePreferences {
    return Intl.message(
      'Preferences',
      name: 'settingsScreenHeaderTitlePreferences',
      desc: '',
      args: [],
    );
  }

  /// `Accent Color`
  String get settingsScreenSettingTitleAccentColor {
    return Intl.message(
      'Accent Color',
      name: 'settingsScreenSettingTitleAccentColor',
      desc: '',
      args: [],
    );
  }

  /// `Biometric Security`
  String get settingsScreenSettingTitleBiometric {
    return Intl.message(
      'Biometric Security',
      name: 'settingsScreenSettingTitleBiometric',
      desc: '',
      args: [],
    );
  }

  /// `Asks for your fingerprint every time you open the app.`
  String get settingsScreenSettingTitleBiometricDescription {
    return Intl.message(
      'Asks for your fingerprint every time you open the app.',
      name: 'settingsScreenSettingTitleBiometricDescription',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get settingsScreenSettingTitleCurrency {
    return Intl.message(
      'Currency',
      name: 'settingsScreenSettingTitleCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get settingsScreenSettingTitleDeleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'settingsScreenSettingTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get settingsScreenSettingTitleEmailAddress {
    return Intl.message(
      'Email Address',
      name: 'settingsScreenSettingTitleEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsScreenSettingTitleLanguage {
    return Intl.message(
      'Language',
      name: 'settingsScreenSettingTitleLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get settingsScreenSettingTitleName {
    return Intl.message(
      'Full Name',
      name: 'settingsScreenSettingTitleName',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settingsScreenSettingTitleTheme {
    return Intl.message(
      'Theme',
      name: 'settingsScreenSettingTitleTheme',
      desc: '',
      args: [],
    );
  }

  /// `AMOLED`
  String get settingsScreenSettingTitleThemeAMOLED {
    return Intl.message(
      'AMOLED',
      name: 'settingsScreenSettingTitleThemeAMOLED',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get settingsScreenSettingTitleThemeDark {
    return Intl.message(
      'Dark',
      name: 'settingsScreenSettingTitleThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settingsScreenSettingTitleThemeLight {
    return Intl.message(
      'Light',
      name: 'settingsScreenSettingTitleThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `Check out this app that helps you manage your income and expenses, safe and secure: https://pillai.xyz/thrifty`
  String get thriftyDrawerMessageShare {
    return Intl.message(
      'Check out this app that helps you manage your income and expenses, safe and secure: https://pillai.xyz/thrifty',
      name: 'thriftyDrawerMessageShare',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get thriftyDrawerTextAbout {
    return Intl.message(
      'About the App',
      name: 'thriftyDrawerTextAbout',
      desc: '',
      args: [],
    );
  }

  /// `This application is open-source and free-to-use, governed under the Apache License 2.0. If you are a developer, please feel free to contribute to the application on GitHub.`
  String get thriftyDrawerTextAboutAppLegalese {
    return Intl.message(
      'This application is open-source and free-to-use, governed under the Apache License 2.0. If you are a developer, please feel free to contribute to the application on GitHub.',
      name: 'thriftyDrawerTextAboutAppLegalese',
      desc: '',
      args: [],
    );
  }

  /// `If you love the app and use it regularly, please donate as little as you can, enough to keep the app alive and running on its own. Donation details can be found on the GitHub homepage or the website. Thank you so much!`
  String get thriftyDrawerTextAboutFooter {
    return Intl.message(
      'If you love the app and use it regularly, please donate as little as you can, enough to keep the app alive and running on its own. Donation details can be found on the GitHub homepage or the website. Thank you so much!',
      name: 'thriftyDrawerTextAboutFooter',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get thriftyDrawerTextCategories {
    return Intl.message(
      'Categories',
      name: 'thriftyDrawerTextCategories',
      desc: '',
      args: [],
    );
  }

  /// `Currencies`
  String get thriftyDrawerTextCurrencies {
    return Intl.message(
      'Currencies',
      name: 'thriftyDrawerTextCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Export to JSON/CSV`
  String get thriftyDrawerTextExport {
    return Intl.message(
      'Export to JSON/CSV',
      name: 'thriftyDrawerTextExport',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get thriftyDrawerTextLogout {
    return Intl.message(
      'Logout',
      name: 'thriftyDrawerTextLogout',
      desc: '',
      args: [],
    );
  }

  /// `Rate the App`
  String get thriftyDrawerTextRate {
    return Intl.message(
      'Rate the App',
      name: 'thriftyDrawerTextRate',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get thriftyDrawerTextSettings {
    return Intl.message(
      'Settings',
      name: 'thriftyDrawerTextSettings',
      desc: '',
      args: [],
    );
  }

  /// `Spread the Love`
  String get thriftyDrawerTextShare {
    return Intl.message(
      'Spread the Love',
      name: 'thriftyDrawerTextShare',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BALANCE`
  String get thriftyOverviewTextBalanceHeading {
    return Intl.message(
      'YOUR BALANCE',
      name: 'thriftyOverviewTextBalanceHeading',
      desc: '',
      args: [],
    );
  }

  /// `You have spent {symbol} {spendAmount} of your total budget of {symbol} {budgetAmount} in the month of {monthYear}.`
  String thriftyOverviewTextBudgetSet(
    Object symbol,
    Object spendAmount,
    Object budgetAmount,
    Object monthYear,
  ) {
    return Intl.message(
      'You have spent $symbol $spendAmount of your total budget of $symbol $budgetAmount in the month of $monthYear.',
      name: 'thriftyOverviewTextBudgetSet',
      desc: '',
      args: [symbol, spendAmount, budgetAmount, monthYear],
    );
  }

  /// `Tap here to set a monthly budget and manage your expenses efficiently.`
  String get thriftyOverviewTextBudgetUnset {
    return Intl.message(
      'Tap here to set a monthly budget and manage your expenses efficiently.',
      name: 'thriftyOverviewTextBudgetUnset',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get transactionBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'transactionBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get transactionBottomSheetButtonTextExpense {
    return Intl.message(
      'Expense',
      name: 'transactionBottomSheetButtonTextExpense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get transactionBottomSheetButtonTextIncome {
    return Intl.message(
      'Income',
      name: 'transactionBottomSheetButtonTextIncome',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get transactionBottomSheetButtonTextUpdate {
    return Intl.message(
      'UPDATE',
      name: 'transactionBottomSheetButtonTextUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get transactionBottomSheetLabelTextAmount {
    return Intl.message(
      'Amount',
      name: 'transactionBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get transactionBottomSheetLabelTextDate {
    return Intl.message(
      'Date',
      name: 'transactionBottomSheetLabelTextDate',
      desc: '',
      args: [],
    );
  }

  /// `Description (optional)`
  String get transactionBottomSheetLabelTextDescription {
    return Intl.message(
      'Description (optional)',
      name: 'transactionBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add New Transaction`
  String get transactionBottomSheetTextHeadingAdd {
    return Intl.message(
      'Add New Transaction',
      name: 'transactionBottomSheetTextHeadingAdd',
      desc: '',
      args: [],
    );
  }

  /// `Update Transaction`
  String get transactionBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Update Transaction',
      name: 'transactionBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }

  /// `{howMany, plural, one {1 transaction hidden} other {{howMany} transactions hidden}}`
  String transactionListHiddenTransactionText(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 transaction hidden',
      other: '$howMany transactions hidden',
      name: 'transactionListHiddenTransactionText',
      desc: '',
      args: [howMany],
    );
  }

  /// `CLEAR`
  String get updateBudgetBottomSheetButtonTextClear {
    return Intl.message(
      'CLEAR',
      name: 'updateBudgetBottomSheetButtonTextClear',
      desc: '',
      args: [],
    );
  }

  /// `SET BUDGET`
  String get updateBudgetBottomSheetButtonTextSetBudget {
    return Intl.message(
      'SET BUDGET',
      name: 'updateBudgetBottomSheetButtonTextSetBudget',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a monthly budget that you feel is conservative according to your spending habits.`
  String get updateBudgetBottomSheetHeadingText {
    return Intl.message(
      'Please enter a monthly budget that you feel is conservative according to your spending habits.',
      name: 'updateBudgetBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get updateBudgetBottomSheetLabelTextBudget {
    return Intl.message(
      'Budget',
      name: 'updateBudgetBottomSheetLabelTextBudget',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'kn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
