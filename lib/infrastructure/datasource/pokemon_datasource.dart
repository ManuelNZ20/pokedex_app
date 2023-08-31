import 'package:dio/dio.dart';
import 'package:pokedex_app/infrastructure/mappers/pokemon_mapper.dart';
import 'package:pokedex_app/infrastructure/models/pokemon/pokemon_card_model.dart';
import '../models/models.dart';
import '../../domain/domain.dart';

class PokemonApiDatasource extends PokemonDatasource {
  
  final dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<List<Result>> getResultResponsePokemon({int? offSet}) async {
    final responseBase = await dio
        .get('/pokemon', queryParameters: {'limit': 10, 'offset': offSet ?? 0});

    final PokemonResponseBase pokemonResponseBase =
        PokemonResponseBase.fromJson(responseBase.data);
    final List<Result> results = pokemonResponseBase.results
        .map((results) => PokemonMapper.resultToEntity(results))
        .toList();
    return results;
  }

  @override
  Future<List<PokemonCard>> getPokemonCard({int? offSet}) async {
    final results = await getResultResponsePokemon(offSet: offSet ?? 0);
    final List<PokemonCard> pokemons = [];
    for (int i = 0; i < results.length; i++) {
      final pokemonResponse = await dio.get('/pokemon-form/${results[i].name}');
      final pokemonModelCard = PokemonCardModel.fromJson(pokemonResponse.data);
      pokemons.add(PokemonMapper.pokemonCard(pokemonModelCard));
    }
    return pokemons;
  }

  @override
  Future<Pokemon> getPokemonDetails({String? name}) async {
    final pokemonResponse =
        await dio.get('/pokemon/$name');
    final PokemonModel model = PokemonModel.fromJson(pokemonResponse.data);
    return PokemonMapper.pokemonToEntity(model);
  }
  // PokemonModel getPokemonModel(Map<String,dynamic> json) => PokemonModel.fromJson(json);
}
