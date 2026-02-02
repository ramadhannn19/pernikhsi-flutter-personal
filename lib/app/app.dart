import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/home/presentation/pages/landingpage/homeview/page.dart';
import 'package:pernikhsi/features/setting/setting.dart';
import 'package:pernikhsi/l10n/l10n.dart';

import 'config.dart';
import 'modules.dart';

/// The root widget of the HSI-Go application.
///
/// This widget is responsible for initializing system UI settings and
/// bootstrapping the app with dependency injection and Bloc providers.
class App extends StatelessWidget {
  const App({super.key});

  /// Builds the base app widget wrapped with dependency injection.
  @override
  Widget build(BuildContext context) {
    // Enable immersive edge-to-edge system UI mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Provide Bloc instances and modules via Modular
    return Modular.withBlocProviders(_AppWidget(key: key));
  }
}

/// Internal widget that configures and builds the MaterialApp.
///
/// Handles theme, localization, navigation, and route setup.
class _AppWidget extends StatelessWidget {
  const _AppWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    // Listen to the current language and theme states from Bloc
    final languageState = context.watch<LanguageBloc>().state;
    final themeState = context.watch<ThemeBloc>().state;

    return MaterialApp(
      // Global navigation key for programmatic navigation
      navigatorKey: navigationKey,

      // Application title (from AppConfig)
      title: AppConfig.appName,

      // Theme configuration (light/dark) based on current theme state
      theme: themeState.theme.toThemeData(),

      // App language/locale configuration
      locale: languageState.language != null
          ? Locale(languageState.language!.code)
          : null,

      // Hide Flutter debug banner
      debugShowCheckedModeBanner: false,

      // Track navigation events
      navigatorObservers: [routeObserver],

      // Setup localization delegates (translations, formatting, etc.)
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // Supported locales for the app (e.g., en, id, etc.)
      supportedLocales: AppLocalizations.supportedLocales,

      // Define the app's route generation logic
      onGenerateRoute: Modular.routes,

      // Initial screen shown when the app starts
      home: const HomeView(),
    );
  }
}
