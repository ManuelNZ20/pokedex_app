import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider);
    final appTheme = ref.watch(themeProviderApp);
    return MaterialApp.router(
      theme: appTheme.themeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
