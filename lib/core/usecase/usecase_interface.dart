import 'dart:async';
import 'package:dartz/dartz.dart';

/// Base contract for a **use case that returns a [Future] result**.
///
/// A `UseCaseFuture` encapsulates **business logic** or **application rules**,
/// keeping them independent from framework or infrastructure details
/// (e.g., network, database).
///
/// It returns an [Either] object:
/// - `Left(Failure)` → when an error occurs
/// - `Right(Result)` → when the operation succeeds
///
/// Example:
/// ```dart
/// class GetUserProfile extends UseCaseFuture<Failure, User, NoParams> {
///   final UserRepository repository;
///
///   GetUserProfile(this.repository);
///
///   @override
///   Future<Either<Failure, User>> call(NoParams params) {
///     return repository.getProfile();
///   }
/// }
///
/// // Usage:
/// final result = await getUserProfile(const NoParams());
/// result.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (user) => print("Hello ${user.name}"),
/// );
/// ```
abstract class UseCaseFuture<Failure, Result, Params> {
  /// Executes this use case with the given [params].
  FutureOr<Either<Failure, Result>> call(Params params);
}

/// Base contract for a **use case that returns a [Stream] result**.
///
/// A `UseCaseStream` is similar to [UseCaseFuture], but designed for
/// **real-time or continuous data flows**, such as sockets, Firebase,
/// or local event streams.
///
/// It also returns an [Either] object wrapped in a [Stream]:
/// - `Left(Failure)` → when an error occurs
/// - `Right(Result)` → when new data is emitted successfully
///
/// Example:
/// ```dart
/// class ListenChatMessages extends UseCaseStream<Failure, Message, ChatParams> {
///   final ChatRepository repository;
///
///   ListenChatMessages(this.repository);
///
///   @override
///   Stream<Either<Failure, Message>> call(ChatParams params) {
///     return repository.listenMessages(params.chatId);
///   }
/// }
///
/// // Usage:
/// listenChatMessages(ChatParams("chat123")).listen((either) {
///   either.fold(
///     (failure) => print("Error: ${failure.message}"),
///     (message) => print("New message: ${message.text}"),
///   );
/// });
/// ```
abstract class UseCaseStream<Failure, Result, Params> {
  /// Executes this use case with the given [params].
  Stream<Either<Failure, Result>> call(Params params);
}
