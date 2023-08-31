import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/domain/domain.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_type_color_provider.dart';
import 'package:pokedex_app/presentation/screens/widgets/shared/chip_type_pokemon.dart';

class PokemonGridView extends ConsumerStatefulWidget {
  final List<PokemonCard> pokemonCards;
  final VoidCallback getPokemonsCards;

  PokemonGridView(
      {super.key, required this.pokemonCards, required this.getPokemonsCards});
      
  final List<Map<String,Color>> colors = [
    {'':Colors.red}
  ];
  @override
  PokemonGridViewState createState() => PokemonGridViewState();
}

class PokemonGridViewState extends ConsumerState<PokemonGridView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 600 >=
          scrollController.position.maxScrollExtent) {
        widget.getPokemonsCards();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final colorTypePokemon = ref.watch(pokemonTypesProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0
      ),
        height: size.height * .9,
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 2.1/2.4
              ),
          itemCount: widget.pokemonCards.length,
          itemBuilder: (context, index) {
            final pokemon = widget.pokemonCards[index];
            return FadeInUp(
              child: GestureDetector(
                onTap: (){
                  context.push('/pokemon_details/${pokemon.name}');
                },
                child: Card(
                  surfaceTintColor:  colorTypePokemon[pokemon.types[0].type.name]!.withOpacity(.35),
                  shadowColor:  colorTypePokemon[pokemon.types[0].type.name]!.withOpacity(.6),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(pokemon.spritesFrontDefault,
                        width: 100,
                        fit: BoxFit.cover,
                        ),
                        Text(pokemon.name,style: textStyle,),
                        Text('${pokemon.types.length} types',style: TextStyle(
                          color: Colors.grey[400],
                        ),),
                        const SizedBox(height: 6,),
                        Row(
                          children: List.generate(pokemon.types.length, (index) => ChipTypePokemon(
                            nameType: pokemon.types[index].type.name,
                            height: 30,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, 
        ));
  }
}
