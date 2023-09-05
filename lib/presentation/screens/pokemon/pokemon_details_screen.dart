import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/presentation/providers/providers.dart';

import '../widgets/customs_widgets.dart';
import '../../../domain/domain.dart';
import 'package:pokedex_app/infrastructure/models/pokemon/pokemon_details_provider.dart';

class PokemonDetailsScreen extends ConsumerStatefulWidget {
  static const String name = 'pokemon-details-screen';

  final String namePokemon;

  const PokemonDetailsScreen({super.key, required this.namePokemon});

  @override
  PokemonDetailsScreenState createState() => PokemonDetailsScreenState();
}

class PokemonDetailsScreenState extends ConsumerState<PokemonDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(pokemonDetailsProvider.notifier).loadPokemon(widget.namePokemon);
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ref.watch(pokemonDetailsProvider)[widget.namePokemon];
    final textStyleButton = Theme.of(context).textTheme;
    final isDarkMode = ref.watch(themeProviderApp).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: pokemon == null
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                  )
                : const Icon(Icons.arrow_back_ios_new_rounded)),
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
      body: SingleChildScrollView(child: _DetailsPokemonView(pokemon: pokemon)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: FilledButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Catch ${widget.namePokemon}',
                style:
                    TextStyle(fontSize: textStyleButton.titleLarge!.fontSize),
              ),
            )),
      ),
    );
  }
}

class _DetailsPokemonView extends StatelessWidget {
  final Pokemon? pokemon;
  const _DetailsPokemonView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    if (pokemon == null) {
      return _LoadingDetailsPokemon(
        pokemon: pokemon,
      );
    }
    return FadeIn(
        duration: const Duration(seconds: 1),
        child: _LoadingDetailsPokemon(pokemon: pokemon));
  }
}

class _LoadingDetailsPokemon extends StatelessWidget {
  final Pokemon? pokemon;

  const _LoadingDetailsPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colorTheme =
        Theme.of(context).colorScheme.onSecondary.withOpacity(.12);
    final colorThemeTitle =
        Theme.of(context).colorScheme.onSurface.withOpacity(.3);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 200,
            child: pokemon != null
                ? Image.network(
                    pokemon!.sprites.other.home.frontDefault,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/front_loading.png'),
          ),
        ),

        const SizedBox(
          height: 8,
        ),
        // Name Pokemon
        SizedBox(
          child: pokemon != null
              ? Text(
                  pokemon!.name,
                  style: textStyle.headlineMedium,
                  maxLines: 2,
                )
              : Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorTheme),
                ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'TYPE',
          style: TextStyle(
              color: colorThemeTitle, fontSize: textStyle.titleSmall!.fontSize),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pokemon != null ? pokemon!.types.length : 2,
                (index) {
              if (pokemon != null) {
                return ChipTypePokemon(
                  nameType: pokemon!.types[index].type.name,
                  height: 40,
                );
              }
              return const ChipTypePokemon(
                nameType: '',
                height: 50,
                width: 100,
              );
            })),
        const SizedBox(
          height: 10,
        ),
        BorderContainer(
            width: size.width,
            height: size.height * .24,
            colorTheme: colorThemeTitle,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationPokemon(child: 'HEIGHT', color: colorThemeTitle),
                    InformationPokemon(child: 'WEIGHT', color: colorThemeTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: const Stream.empty(),
                      initialData: pokemon,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ContainerInfoLoading(
                              colorThemeTitle: colorThemeTitle);
                        }
                        return InformationPokemon(
                            child: '${snapshot.data!.height}', color: null);
                      },
                    ),
                    StreamBuilder(
                      stream: const Stream.empty(),
                      initialData: pokemon,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ContainerInfoLoading(
                              colorThemeTitle: colorThemeTitle);
                        }
                        return InformationPokemon(
                            child: '${snapshot.data!.weight} lbs', color: null);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationPokemon(
                        child: 'SPECIES', color: colorThemeTitle),
                    InformationPokemon(
                        child: 'ABILITIES', color: colorThemeTitle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: const Stream.empty(),
                      initialData: pokemon,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ContainerInfoLoading(
                              colorThemeTitle: colorThemeTitle);
                        }
                        return InformationPokemon(
                          child: snapshot.data!.species.name,
                          color: null,
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: const Stream.empty(),
                      initialData: pokemon,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ContainerInfoLoading(
                              colorThemeTitle: colorThemeTitle);
                        }
                        return SizedBox(
                          width: 100,
                          child: Wrap(
                            children: List.generate(
                                snapshot.data!.abilities.length,
                                (index) => Text(
                                      '${pokemon!.abilities[index].ability.name}${index + 1 == snapshot.data!.abilities.length ? '' : ','}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        // SPECIES MOVIES
        BorderContainer(
            width: size.width,
            height: size.height * .5,
            colorTheme: colorThemeTitle,
            widget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'SPECIAL MOVIES',
                    style: TextStyle(
                        color: colorThemeTitle,
                        fontSize: textStyle.titleSmall!.fontSize),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: pokemon == null ? 4 : pokemon!.moves.length,
                  itemBuilder: (context, index) {
                    if (pokemon == null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ContainerInfoLoading(
                          colorThemeTitle: colorThemeTitle,
                        ),
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          2,
                          (i) => Container(
                                width: 120,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 6.0),
                                child: Center(
                                  child: Text(
                                    pokemon!.moves[index].move.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                    );
                  },
                )),
              ],
            ))
      ],
    );
  }
}

class ContainerInfoLoading extends StatelessWidget {
  const ContainerInfoLoading({
    required this.colorThemeTitle,
  });

  final Color colorThemeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: colorThemeTitle.withOpacity(.1),
      ),
    );
  }
}

class InformationPokemon extends StatelessWidget {
  final String child;
  final Color? color;
  const InformationPokemon(
      {super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Text(
        child,
        textAlign: TextAlign.center,
        style: TextStyle(color: color),
      ),
    );
  }
}
