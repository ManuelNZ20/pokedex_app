import 'package:pokedex_app/domain/domain.dart';

abstract class PokemonRepository {


  Future<List<Result>> getResultResponsePokemon({int offSet = 0});
  
  Future<List<PokemonCard>> getPokemonCard({int offSet = 0});
  
  Future<Pokemon> getPokemonDetails({String name});
  }