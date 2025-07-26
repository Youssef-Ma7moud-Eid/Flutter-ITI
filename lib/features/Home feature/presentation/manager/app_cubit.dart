import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/cache/cache_helper.dart';
import 'package:iti_flutter/core/cache/cache_helper_key.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/manager/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState()) {
    _loadTheme();
  }

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> selectTheme(ThemeModeState theme) async {
    currentTheme = theme;

    await CacheHelper().saveData(
      key: CacheHelperKey.themeMode,
      value: currentTheme.name,
    );
    emit(ThemeState());
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  Future<void> _loadTheme() async {
    String? savedTheme = await CacheHelper().getData(
      key: CacheHelperKey.themeMode,
    );
    if (savedTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (element) => element.name == savedTheme,
        orElse: () => ThemeModeState.system,
      );
    }
    emit(ThemeState());
  }
}

enum ThemeModeState { light, dark, system }
// 1. select theme (light,dark,system)
// 2. get theme of ThemeMode type
// 3. load theme