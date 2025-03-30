import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Convert stored integer to ThemeMode
    return ThemeMode.values[json['themeMode'] ?? 0];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Store ThemeMode as an integer
    return {'themeMode': state.index};
  }
}
