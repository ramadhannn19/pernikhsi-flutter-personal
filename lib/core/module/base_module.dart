import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// Base class for defining application modules.
///
/// A **module** represents a feature or functional area of the app,
/// encapsulating its **routing**, **dependency injection**, and **BlocProviders**.
///
/// Each module should:
/// - Define its own **routes** (navigation paths and pages)
/// - Register required **dependencies** in the DI container ([GetIt])
/// - Provide **BlocProviders** for state management
///
/// Example implementation:
/// ```dart
/// class HomeModule extends BaseModule {
///   @override
///   Map<String, Route> routes(RouteSettings settings) {
///     return {
///       '/home': MaterialPageRoute(builder: (_) => const HomePage()),
///     };
///   }
///
///   @override
///   Future<void> inject(GetIt getIt) async {
///     getIt.registerLazySingleton(() => HomeRepository());
///     getIt.registerFactory(() => HomeBloc(getIt<HomeRepository>()));
///   }
///
///   @override
///   List<BlocProvider> blocProviders() {
///     return [BlocProvider(create: (_) => GetIt.I<HomeBloc>())];
///   }
/// }
/// ```
abstract class BaseModule {
  /// Defines routes for your module.
  ///
  /// Should return a map of route names to [Route] objects.
  ///
  /// Example:
  /// ```dart
  /// {
  ///   '/home': MaterialPageRoute(builder: (_) => HomePage()),
  ///   '/auth': CupertinoPageRoute(builder: (_) => AuthPage()),
  /// }
  /// ```
  Map<String, Route> routes(RouteSettings settings);

  /// Injects all dependencies for this module into the provided [getIt] container.
  ///
  /// Use this to register repositories, services, or use cases required
  /// by the module.
  Future<void> inject(GetIt getIt);

  /// Provides a list of [BlocProvider] instances used by this module.
  ///
  /// These providers ensure that BLoCs are available in the widget tree
  /// for the module’s pages.
  ///
  /// Example:
  /// ```dart
  /// [
  ///   BlocProvider(create: (_) => MyBloc()),
  /// ]
  /// ```
  List<BlocProvider> blocProviders();
}
