import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pernikhsi/core/core.dart';

import 'package:pernikhsi/features/home/presentation/pages/landingpage/homeview/page.dart';

import 'home.dart';

/// Module definition for the **Home feature**.
///
/// A [BaseModule] groups together:
/// - **Data layer** dependencies (API data sources, repositories)
/// - **Domain layer** dependencies (use cases)
/// - **Presentation layer** dependencies (BLoCs, routes, pages)
///
/// This ensures the Home feature is self-contained and follows
/// Clean Architecture boundaries.
///
/// ### Example flow
/// UI → BLoC → UseCase → Repository → DataSource → API
class HomeModule implements BaseModule {
  @override
  Future inject(GetIt getIt) async {
    // ----------------------------
    // Data Layer
    // ----------------------------
    getIt
      ..registerLazySingleton<HomeApiDataSource>(
        () => HomeApiDataSourceImpl(getIt()),
      )
      ..registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt()),
      );

    // ----------------------------
    // Domain Layer
    // ----------------------------
    getIt.registerLazySingleton(() => GetExampleUsecase(getIt()));

    // ----------------------------
    // Presentation Layer
    // ----------------------------
    // Register BLoCs here if needed.
    // Example:
    // getIt.registerFactory(() => ExampleBloc(getIt()));
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    // Define feature-specific routes here.
    // Example:
    // final args = (settings.arguments ?? {}) as Map;
    return {
      HomeView.routeName: MaterialPageRoute(
        builder: (_) => const HomeView(),
        settings: settings,
      ),
    };
  }

  @override
  List<BlocProvider> blocProviders() {
    // Provide feature-specific BLoCs here.
    return [
      // BlocProvider<ExampleBloc>(create: (context) => ExampleBloc()),
    ];
  }
}
