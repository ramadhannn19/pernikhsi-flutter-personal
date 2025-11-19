import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:pernikhsi/core/core.dart';

import 'app/app.dart';
import 'app/locator.dart';

/// Main entry point of the Flutter application.
///
/// This function wraps the app execution inside [runZonedGuarded] to ensure
/// that any unhandled errors are properly logged and captured.
///
/// Steps performed:
/// 1. Ensures the Flutter binding is initialized.
/// 2. Sets up the service locator for dependency injection.
/// 3. Assigns a custom [Bloc.observer] to observe BLoC events and transitions.
/// 4. Runs the root [App] widget.
/// 5. Captures and logs any errors thrown within the zone.
Future<void> main() async {
  runZonedGuarded(
    () async {
      // Required to interact with platform channels before runApp is called.
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize the dependency injection container (GetIt).
      await setupLocator();

      // Assign custom BLoC observer to track events and transitions.
      Bloc.observer = AppBlocObserver();

      // Start the Flutter application with the root widget.
      return runApp(const App());
    },
    (error, stackTrace) {
      // Log the error details to the developer console.
      log(error.toString(), name: 'LOG', stackTrace: stackTrace);

      // Capture and forward error details using the registered use case.
      GetIt.I<CaptureErrorUseCase>().call(
        CaptureErrorParams(error, stackTrace),
      );
    },
  );
}
