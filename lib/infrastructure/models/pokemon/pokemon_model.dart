
class PokemonModel {
    final List<AbilityModel> abilities;
    final int baseExperience;
    final List<SpeciesModel> forms;
    final int height;
    final int id;
    final bool isDefault;
    final List<MoveModel> moves;
    final String name;
    final int order;
    final SpeciesModel species;
    final SpritesModel sprites;
    final List<StatModel> stats;
    final List<TypeModel> types;
    final int weight;

    PokemonModel({
        required this.abilities,
        required this.baseExperience,
        required this.forms,
        required this.height,
        required this.id,
        required this.isDefault,
        required this.moves,
        required this.name,
        required this.order,
        required this.species,
        required this.sprites,
        required this.stats,
        required this.types,
        required this.weight,
    });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<AbilityModel>.from(json["abilities"].map((x) => AbilityModel.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: List<SpeciesModel>.from(json["forms"].map((x) => SpeciesModel.fromJson(x))),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        moves: List<MoveModel>.from(json["moves"].map((x) => MoveModel.fromJson(x))),
        name: json["name"],
        order: json["order"],
        species: SpeciesModel.fromJson(json["species"]),
        sprites: SpritesModel.fromJson(json["sprites"]),
        stats: List<StatModel>.from(json["stats"].map((x) => StatModel.fromJson(x))),
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
        weight: json["weight"],
    );

}

class AbilityModel {
    final SpeciesModel ability;
    final bool isHidden;
    final int slot;

    AbilityModel({
        required this.ability,
        required this.isHidden,
        required this.slot,
    });

    factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        ability: SpeciesModel.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class SpeciesModel {
    final String name;
    final String url;

    SpeciesModel({
        required this.name,
        required this.url,
    });

    factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class MoveModel {
    final SpeciesModel move;
    final List<VersionGroupDetailModel> versionGroupDetails;

    MoveModel({
        required this.move,
        required this.versionGroupDetails,
    });

    factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
        move: SpeciesModel.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetailModel>.from(json["version_group_details"].map((x) => VersionGroupDetailModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
    };
}

class VersionGroupDetailModel {
    final int levelLearnedAt;
    final SpeciesModel moveLearnMethod;
    final SpeciesModel versionGroup;

    VersionGroupDetailModel({
        required this.levelLearnedAt,
        required this.moveLearnMethod,
        required this.versionGroup,
    });

    factory VersionGroupDetailModel.fromJson(Map<String, dynamic> json) => VersionGroupDetailModel(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: SpeciesModel.fromJson(json["move_learn_method"]),
        versionGroup: SpeciesModel.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
    };
}

class SpritesModel {
    final String frontDefault;
    final String frontShiny;
    final OtherModel other;

    SpritesModel({
        required this.frontDefault,
        required this.frontShiny,
        required this.other,
    });

    factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        other: OtherModel.fromJson(json["other"]),
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "other": other.toJson(),
    };
}

class OtherModel {
    final DreamWorldModel dreamWorld;
    final HomeModel home;
    final HomeModel officialArtwork;

    OtherModel({
        required this.dreamWorld,
        required this.home,
        required this.officialArtwork,
    });

    factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        dreamWorld: DreamWorldModel.fromJson(json["dream_world"]),
        home: HomeModel.fromJson(json["home"]),
        officialArtwork: HomeModel.fromJson(json["official-artwork"]),
    );

    Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
    };
}

class DreamWorldModel {
    final String frontDefault;

    DreamWorldModel({
        required this.frontDefault,
    });

    factory DreamWorldModel.fromJson(Map<String, dynamic> json) => DreamWorldModel(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
    };
}

class HomeModel {
    final String frontDefault;
    final String frontShiny;

    HomeModel({
        required this.frontDefault,
        required this.frontShiny,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class StatModel {
    final int baseStat;
    final int effort;
    final SpeciesModel stat;

    StatModel({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: SpeciesModel.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}

class TypeModel {
    final int slot;
    final SpeciesModel type;

    TypeModel({
        required this.slot,
        required this.type,
    });

    factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: SpeciesModel.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
    };
}
