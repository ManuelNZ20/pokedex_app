import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/pokemon/initial_loading_provider.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_provider.dart';
import 'package:pokedex_app/presentation/providers/providers.dart';
import 'package:pokedex_app/presentation/screens/pokemon/pokemon_gridview.dart';
import 'package:pokedex_app/presentation/screens/screens.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(pokemonCardProvider.notifier).getPokemonsCards();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonCards = ref.watch(pokemonCardProvider);
    final initialLoading = ref.watch(initialLoadingProvider);
    final isDarkMode = ref.watch(themeProviderApp).isDarkMode;

    if (initialLoading) return const FullScreenLoader();

    return CustomScrollView(slivers: [
      SliverAppBar(
        leading: IconButton.outlined(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/1200px-International_Pok%C3%A9mon_logo.svg.png',
            width: 100,
            height: 35,
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProviderApp.notifier).toggleTheme();
              },
              icon: Icon(isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_rounded))
        ],
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return PokemonGridView(
            pokemonCards: pokemonCards,
            getPokemonsCards:
                ref.read(pokemonCardProvider.notifier).getPokemonsCards,
          );
        }, childCount: 1),
      ),
    ]);
  }
}
