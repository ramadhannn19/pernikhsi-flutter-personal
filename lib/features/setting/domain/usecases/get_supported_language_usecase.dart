import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:pernikhsi/core/core.dart';

/// Use case for retrieving the list of supported [Language]s
/// based on the application's available reference languages
/// and the device's current [Locale]s.
///
/// Responsibilities:
/// - Compares device locales with app's reference languages
/// - Filters and returns only the intersection (supported languages)
/// - Ensures unique results (removes duplicates)
///
/// ### Example usage
/// ```dart
/// final useCase = GetSupportedLanguageUseCase();
/// final result = await useCase(
///   SupportedLanguageParams(
///     referenceLanguages: LanguagesData.data,
///     locales: WidgetsBinding.instance.platformDispatcher.locales,
///   ),
/// );
///
/// result.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (languages) => print("Supported: ${languages.map((e) => e.code)}"),
/// );
/// ```
///
/// ### Return type
/// - `Right(List<Language>)` → supported languages
/// - `Left(Failure)` → error occurred (unlikely, since this is pure logic)
class GetSupportedLanguageUseCase
    implements UseCaseFuture<Failure, List<Language>, SupportedLanguageParams> {
  @override
  FutureOr<Either<Failure, List<Language>>> call(
    SupportedLanguageParams params,
  ) async {
    final currentSupportedLangCode = <String>[];
    final result = <Language>[];

    // Collect language codes from device locales
    for (final item in params.locales) {
      currentSupportedLangCode.add(item.languageCode);
    }

    // Filter only languages that match reference list
    for (final item in params.referenceLanguages) {
      if (currentSupportedLangCode.contains(item.code)) {
        result.add(item);
      }
    }

    // Remove duplicates by converting to Set, then back to List
    return Right(result.toSet().toList());
  }
}

/// Parameters for [GetSupportedLanguageUseCase].
///
/// - [referenceLanguages]: the app's full list of supported languages
/// - [locales]: the device's current locales (from Flutter bindings)
class SupportedLanguageParams {
  SupportedLanguageParams({
    required this.referenceLanguages,
    required this.locales,
  });

  final List<Language> referenceLanguages;
  final List<Locale> locales;
}
