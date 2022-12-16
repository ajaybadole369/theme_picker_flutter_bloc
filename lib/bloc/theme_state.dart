part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class SelectedThemeState extends ThemeState {
  final String color;

  SelectedThemeState({required this.color});
}
