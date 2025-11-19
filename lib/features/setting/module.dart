import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pernikhsi/core/core.dart';

import 'setting.dart';

class SettingModule implements BaseModule {
  @override
  Future inject(GetIt getIt) async {
    // Data
    getIt
      ..registerLazySingleton<SettingCacheDataSource>(
        () => SettingCacheDataSourceImpl(getIt()),
      )
      ..registerLazySingleton<SettingRepository>(
        () => SettingRepositoryImpl(getIt()),
      );

    // Domain
    getIt
      ..registerLazySingleton(() => GetLanguageSettingUseCase(getIt()))
      ..registerLazySingleton(() => GetSettingUseCase(getIt()))
      ..registerLazySingleton(() => GetThemeSettingUseCase(getIt()))
      ..registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()))
      ..registerLazySingleton(() => SaveSettingUseCase(getIt()))
      ..registerLazySingleton(() => SaveThemeSettingUseCase(getIt()))
      ..registerLazySingleton(GetSupportedLanguageUseCase.new)
      ..registerLazySingleton(() => SetDoneOnboardingUseCase(getIt()))
      ..registerLazySingleton(() => GetOnboardingStatusUseCase(getIt()));

    // Presentation
    getIt
      ..registerFactory(
        () => LanguageBloc(
          getLanguageSetting: getIt(),
          saveLanguageSetting: getIt(),
          getSupportedLanguage: getIt(),
          captureErrorUseCase: getIt(),
        ),
      )
      ..registerFactory(
        () => ThemeBloc(getThemeSetting: getIt(), saveThemeSetting: getIt()),
      );
  }

  @override
  Map<String, Route> routes(RouteSettings setting) {
    // final args = (setting.arguments ?? {}) as Map;
    return {
      // ExamplePage.routeName: MaterialPageRoute(
      //   builder: (_) => const ExamplePage(),
      //   setting: setting,
      // ),
    };
  }

  @override
  List<BlocProvider> blocProviders() {
    return [
      // Provides the ThemeProvider to manage theme changes
      BlocProvider<ThemeBloc>(
        create: (context) => GetIt.I<ThemeBloc>()..add(ThemeStarted()),
      ),
      // Provides the LanguageProvider to manage language changes
      BlocProvider<LanguageBloc>(
        create: (context) => GetIt.I<LanguageBloc>()..add(LanguageStarted()),
      ),
    ];
  }
}
