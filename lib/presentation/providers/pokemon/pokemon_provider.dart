import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_repository_provider.dart';
import '../../../domain/domain.dart';

final pokemonCardProvider = StateNotifierProvider<PokemonCardNotifier,List<PokemonCard>>((ref){
  final getPokemonCard = ref.watch(pokemonRepositoryProvider).getPokemonCard;
  return PokemonCardNotifier(getPokemonCard: getPokemonCard);
});

typedef PokemonCardCallback = Future<List<PokemonCard>> Function({int offSet});


class PokemonCardNotifier extends StateNotifier<List<PokemonCard>> {
  PokemonCardCallback getPokemonCard;
  bool isLoading = false;
  static int offSet = 0;
  PokemonCardNotifier({
    required this.getPokemonCard
  }):super([]);

  Future<void> getPokemonsCards() async {
    if(isLoading) return;
    isLoading = true;
    final List<PokemonCard> listPokemon = await getPokemonCard(offSet:offSet);
    offSet += 10;
    state = [
      ...state,
      ...listPokemon
    ];
    isLoading = false;
    
  }

}