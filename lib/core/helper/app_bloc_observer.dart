import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom [BlocObserver] for logging BLoC state changes and errors.
///
/// This class helps with debugging by automatically logging:
/// - **State changes** when a BLoC emits a new state
/// - **Errors** when a BLoC throws an exception
///
/// By default, logs are sent to Dart's [log] function with the tag `"BLOC"`.
///
/// Example usage:
/// ```dart
/// void main() {
///   Bloc.observer = AppBlocObserver();
///   runApp(const MyApp());
/// }
/// ```
///
/// Example log outputs:
/// ```text
/// onChange(CounterBloc, Change { currentState: 0, nextState: 1 })
/// onError(UserBloc, Exception: Unauthorized, StackTrace...)
/// ```
class AppBlocObserver extends BlocObserver {
  /// Called whenever a BLoC's state changes.
  ///
  /// Logs the [bloc] type and the [change] details.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)', name: 'BLOC');
  }

  /// Called whenever a BLoC throws an error.
  ///
  /// Logs the [bloc] type, the [error], and the [stackTrace].
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
      name: 'BLOC',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
