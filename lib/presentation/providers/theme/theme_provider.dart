import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/config/theme/app_theme.dart';

final themeProviderApp = StateNotifierProvider<ThemeNotifier,AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {


  ThemeNotifier():super(
    AppTheme(
      isDarkMode: false
    )
  );


  Future<void> toggleTheme() async {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );
  }



}