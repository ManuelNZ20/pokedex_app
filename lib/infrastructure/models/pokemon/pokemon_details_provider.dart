
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/domain/domain.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_repository_provider.dart';

final pokemonDetailsProvider = StateNotifierProvider<PokemonDetailsNotifier,Map<String,Pokemon>>((ref){
  final getPokemon = ref.watch(pokemonRepositoryProvider).getPokemonDetails;
  return PokemonDetailsNotifier(getPokemonDetails: getPokemon);
});

typedef PokemonDetailsCallback = Future<Pokemon> Function({String? name});


class PokemonDetailsNotifier extends StateNotifier<Map<String,Pokemon>> {

  final PokemonDetailsCallback getPokemonDetails;

  PokemonDetailsNotifier({
    required this.getPokemonDetails
  }):super({});

  Future<void> loadPokemon(String name) async {
    if(state[name]!=null) return;

    final pokemon = await getPokemonDetails(name:name);
    state = {
      ...state,
      name:pokemon
    };
  }



}
