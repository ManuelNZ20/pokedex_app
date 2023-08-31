import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/infrastructure/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/infrastructure/repositories/pokemon_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonRepositoryImpl>((ref) {
  return PokemonRepositoryImpl(pokemonDatasource: PokemonApiDatasource());
});