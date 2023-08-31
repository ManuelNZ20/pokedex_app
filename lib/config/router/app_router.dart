import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
      GoRoute(
          path: '/',
          name: HomeScreen.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: 'pokemon_details/:namePokemon',
                name: PokemonDetailsScreen.name,
                builder: (context, state) {
                  final String namePokemon = state.pathParameters['namePokemon'] ?? '';
                  return PokemonDetailsScreen(
                    namePokemon: namePokemon.toString(),
                  );
                })
          ]),
]);
