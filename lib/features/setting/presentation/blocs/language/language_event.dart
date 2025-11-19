part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageStarted extends LanguageEvent {}

class LanguageChanged extends LanguageEvent {
  const LanguageChanged(this.language);

  final Language language;

  @override
  List<Object> get props => [language];
}
