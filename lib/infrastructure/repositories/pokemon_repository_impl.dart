import 'package:pokedex_app/domain/repositories/pokemons_repository.dart';

import '../../domain/domain.dart';

class PokemonRepositoryImpl extends PokemonRepository {

  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl({required this.pokemonDatasource});

  @override
  Future<List<PokemonCard>> getPokemonCard({int offSet = 0}) {
    return pokemonDatasource.getPokemonCard(offSet: offSet);
  }

  @override
  Future<Pokemon> getPokemonDetails({String? name}) {
    return pokemonDatasource.getPokemonDetails(name: name??'');
  }

  @override
  Future<List<Result>> getResultResponsePokemon({int offSet = 0}) {
    return pokemonDatasource.getResultResponsePokemon(offSet: offSet);
  }

}