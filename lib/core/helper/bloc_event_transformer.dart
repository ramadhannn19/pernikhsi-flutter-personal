import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

/// Returns an [EventTransformer] that throttles incoming events and
/// drops events that occur during the throttle period.
///
/// - Only the **first event** in a throttle window is processed.
/// - Subsequent events during the window are **ignored/dropped**.
///
/// Useful when you want to prevent spamming events (e.g., rapid button taps).
///
/// Example:
/// ```dart
/// on<ButtonPressedEvent>(
///   _onButtonPressed,
///   transformer: throttleDroppable(const Duration(seconds: 1)),
/// );
/// ```
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

/// Returns an [EventTransformer] that throttles incoming events and
/// restarts the throttle period whenever a new event is emitted.
///
/// - Similar to [throttleDroppable], but instead of dropping,
///   it **restarts the throttle timer** on new events.
/// - Ensures that the **latest event** in a burst is always processed.
///
/// Useful for cases like search queries where you only care about the last event.
///
/// Example:
/// ```dart
/// on<SearchQueryChanged>(
///   _onSearchQueryChanged,
///   transformer: throttleRestartable(const Duration(milliseconds: 500)),
/// );
/// ```
EventTransformer<E> throttleRestartable<E>(Duration duration) {
  return (events, mapper) {
    return restartable<E>().call(events.throttle(duration), mapper);
  };
}

/// Returns an [EventTransformer] that debounces incoming events,
/// emitting only the **last event** after the specified [duration]
/// has passed without any new events.
///
/// - Useful for text input or search bars, where you only want to trigger
///   after the user stops typing.
/// - Reduces unnecessary state updates from rapid event streams.
///
/// Example:
/// ```dart
/// on<SearchQueryChanged>(
///   _onSearchQueryChanged,
///   transformer: debounce(const Duration(milliseconds: 300)),
/// );
/// ```
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
