import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString('pref_key');
      if (value != null) {
        emit(SelectedThemeState(color: value));
      }
    });
  }
}

/// SharedPreferences ///

class ThemePreferences {
  static const prefKey = "pref_key";

 static setTheme(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(prefKey, value);
  }
}
