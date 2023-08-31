
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final pokemonCard = ref.watch(pokemonCardProvider).isEmpty;
  return pokemonCard ;
});
