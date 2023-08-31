import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokedex_app/config/router/app_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return appRouter;
});
