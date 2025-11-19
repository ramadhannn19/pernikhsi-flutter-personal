/// Enum representing different generic status states.
///
/// This is commonly used in state management (e.g., BLoC, Riverpod, Provider)
/// to track the lifecycle of an operation such as data fetching, submitting,
/// or background processing.
enum Status {
  /// Initial status (default/idle state).
  ///
  /// Indicates that no action has been taken yet.
  initial,

  /// Loading status.
  ///
  /// Represents an ongoing process, such as fetching or submitting data.
  loading,

  /// Infinite state.
  ///
  /// Typically used for infinite scrolling or paginated lists
  /// to indicate more data is being loaded continuously.
  isInfinite,

  /// Success status.
  ///
  /// Indicates that the operation completed successfully.
  success,

  /// Failure status.
  ///
  /// Indicates that the operation failed due to an error.
  failure,
}
