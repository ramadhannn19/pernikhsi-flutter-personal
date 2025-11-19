import 'package:pernikhsi/core/core.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'config.dart';
import 'modules.dart';

/// Global singleton instance of the GetIt service locator.
///
/// This acts as the dependency injection container for the application.
/// All shared services, repositories, and utilities should be registered here
/// and retrieved via `getIt<T>()`.
final getIt = GetIt.instance;

/// Initializes the service locator with all required dependencies.
///
/// This method should be called once at app startup (e.g., in `main.dart`).
/// It sets up both core services (network, storage, error handling)
/// and feature modules via [Modular].
Future<void> setupLocator() async {
  await _setupCore();

  // Register all feature modules
  await Modular.init(appModules, GetIt.instance);
}

/// Registers core-level dependencies such as Dio (HTTP client),
/// Hive (local database), and global configurations.
///
/// - Configures Equatable to stringify objects if enabled
/// - Sets up Dio with base URL and interceptors
/// - Initializes Hive database (except for Web)
Future<void> _setupCore() async {
  // Enable or disable automatic stringification for Equatable
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  // Register error capturing use case
  getIt.registerLazySingleton(CaptureErrorUseCase.new);

  // Register Dio client with base options and interceptors
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(baseUrl: AppConfig.baseUrl)
      ..interceptors.addAll([
        // Logs requests and responses in debug mode
        LogInterceptor(requestBody: true, responseBody: true),
        // Adds authentication headers/tokens automatically
        AuthHttpInterceptor(),
      ]),
  );

  // Initialize Hive only if the platform is not Web
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  // Register Hive interface globally
  getIt.registerLazySingleton<HiveInterface>(() => Hive);
}
