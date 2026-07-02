import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart' as models;
import 'package:bethriftytoday/screens/screens.dart';
import 'package:bethriftytoday/services/category.dart';
import 'package:bethriftytoday/services/currency.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    updateStatusBarColor(context);
    setupCloudMessaging();

    return MultiProvider(
      providers: [
        StreamProvider<models.User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<CurrencyProvider>(
          create: (context) => CurrencyProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Consumer<SettingsProvider>(
          builder: (context, settings, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: settings.appLang,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ],
            title: 'Be Thrifty Today',
            theme: themeSelector(settings.theme).copyWith(
              colorScheme: themeSelector(settings.theme).colorScheme.copyWith(
                secondary: settings.accentColor,
              ),
            ),
            initialRoute: SplashScreen.routeName,
            routes: routes,
          ),
        ),
      ),
    );
  }

  ThemeData themeSelector(ThemeOptions option) {
    switch (option) {
      case ThemeOptions.light:
        return theme;
      case ThemeOptions.dark:
        return darkTheme;
      case ThemeOptions.amoled:
        return amoledTheme;
    }
  }

  setupCloudMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission for iOS
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: ${message.data}");
    });

    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: ${message.data}");
    });
  }
}
