import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'base_module.dart';

/// Central class responsible for managing **application modularization**.
///
/// This class ties together all registered [BaseModule]s by handling:
/// - **Dependency Injection (DI)** initialization
/// - **Route resolution** (delegating route lookup to each module)
/// - **BlocProviders aggregation** (wrapping the app with all BLoCs)
///
/// Example usage in `main.dart`:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   await Modular.init([HomeModule(), AuthModule()], GetIt.I);
///
///   runApp(Modular.withBlocProviders(const MyApp()));
/// }
/// ```
class Modular {
  /// Internal list of registered modules.
  static List<BaseModule> modulesX = [];

  /// Initializes the modular setup with the provided [modules] and dependency injector [sl].
  ///
  /// Should be called once at app startup to set up dependency injection (DI)
  /// for all modules.
  ///
  /// Example:
  /// ```dart
  /// await Modular.init([HomeModule(), AuthModule()], GetIt.I);
  /// ```
  static Future<void> init(List<BaseModule> modules, GetIt sl) async {
    modulesX = modules;

    for (var item in modules) {
      await item.inject(sl);
    }
  }

  /// Resolves routes for the application based on registered modules.
  ///
  /// Iterates over all [modulesX] and collects their routes.
  /// Returns the matching route for [settings.name], or a fallback
  /// "Page not found" screen if no route matches.
  static Route<dynamic> routes(RouteSettings settings) {
    // Aggregate all module routes
    final routeModules = <String, Route>{};

    for (var item in modulesX) {
      routeModules.addAll(item.routes(settings));
    }

    return routeModules['${settings.name}'] ??
        MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('Page not found :(')),
            );
          },
        );
  }

  /// Wraps the application with all [BlocProvider]s defined in modules.
  ///
  /// Useful for injecting multiple BLoCs into the widget tree globally.
  ///
  /// Example:
  /// ```dart
  /// runApp(Modular.withBlocProviders(const MyApp()));
  /// ```
  static Widget withBlocProviders(Widget app) {
    final allBlocProviders = modulesX
        .expand((module) => module.blocProviders())
        .toList();

    return MultiBlocProvider(providers: allBlocProviders, child: app);
  }
}
