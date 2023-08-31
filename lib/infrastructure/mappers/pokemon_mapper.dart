import 'package:pokedex_app/domain/domain.dart';
import 'package:pokedex_app/infrastructure/models/pokemon/pokemon_card_model.dart';
import 'package:pokedex_app/infrastructure/models/pokemon/pokemon_model.dart';
import 'package:pokedex_app/infrastructure/models/pokemon/pokemon_response_base.dart';

class PokemonMapper {
  static PokemonResponse responseToEntity(PokemonResponseBase baseResponse) =>
      PokemonResponse(
          count: baseResponse.count,
          results: baseResponse.results.map((e) => resultToEntity(e)).toList());

  static Result resultToEntity(ResultBase resultBase) =>
      Result(name: resultBase.name, url: resultBase.url);

  static PokemonCard pokemonCard(PokemonCardModel model) =>
      PokemonCard(
        id : model.id,
        name : model.name,
        types : model.types.map((e) => typePokemon(e)).toList(),
        spritesFrontDefault : model.spritesFrontDefault);

  static Pokemon pokemonToEntity(PokemonModel model) => Pokemon(
      abilities: model.abilities.map((e) => ability(e)).toList(),
      baseExperience: model.baseExperience,
      forms: model.forms.map((e) => species(e)).toList(),
      height: model.height,
      id: model.id,
      isDefault: model.isDefault,
      moves: model.moves.map((e) => move(e)).toList(),
      name: model.name,
      order: model.order,
      species: species(model.species),
      sprites: sprites(model.sprites),
      stats: model.stats.map((e) => stat(e)).toList(),
      types: model.types.map((e) => typePokemon(e)).toList(),
      weight: model.weight);

  static Ability ability(AbilityModel model) => Ability(
      ability: species(model.ability),
      isHidden: model.isHidden,
      slot: model.slot);

  static Species species(SpeciesModel model) =>
      Species(name: model.name, url: model.url);

  static Move move(MoveModel model) => Move(
      move: species(model.move),
      versionGroupDetails:
          model.versionGroupDetails.map((e) => versionGroupDetail(e)).toList());

  static VersionGroupDetail versionGroupDetail(VersionGroupDetailModel model) =>
      VersionGroupDetail(
          levelLearnedAt: model.levelLearnedAt,
          moveLearnMethod: species(model.moveLearnMethod),
          versionGroup: species(model.versionGroup));
  static Sprites sprites(SpritesModel model) => Sprites(
      frontDefault: model.frontDefault,
      frontShiny: model.frontShiny,
      other: other(model.other));

  static Other other(OtherModel model) => Other(
      dreamWorld: _dreamWorld(model.dreamWorld),
      home: _home(model.home),
      officialArtwork: _home(model.officialArtwork));

  static DreamWorld _dreamWorld(DreamWorldModel model) =>
      DreamWorld(frontDefault: model.frontDefault);

  static Home _home(HomeModel model) =>
      Home(frontDefault: model.frontDefault, frontShiny: model.frontShiny);

  static Stat stat(StatModel model) => Stat(
      baseStat: model.baseStat,
      effort: model.effort,
      stat: species(model.stat));

  static TypePokemon typePokemon(TypeModel model) =>
      TypePokemon(slot: model.slot, type: species(model.type));
}
