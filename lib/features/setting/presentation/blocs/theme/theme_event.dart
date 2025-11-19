part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeStarted extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.theme);

  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}
