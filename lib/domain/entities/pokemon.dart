class Pokemon {
    final List<Ability> abilities;
    final int baseExperience;
    final List<Species> forms;
    final int height;
    final int id;
    final bool isDefault;
    final List<Move> moves;
    final String name;
    final int order;
    final Species species;
    final Sprites sprites;
    final List<Stat> stats;
    final List<TypePokemon> types;
    final int weight;

    Pokemon({
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

}

class Ability {
    final Species ability;
    final bool isHidden;
    final int slot;

    Ability({
        required this.ability,
        required this.isHidden,
        required this.slot,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    final String name;
    final String url;

    Species({
        required this.name,
        required this.url,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Move {
    final Species move;
    final List<VersionGroupDetail> versionGroupDetails;

    Move({
        required this.move,
        required this.versionGroupDetails,
    });

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
    };
}

class VersionGroupDetail {
    final int levelLearnedAt;
    final Species moveLearnMethod;
    final Species versionGroup;

    VersionGroupDetail({
        required this.levelLearnedAt,
        required this.moveLearnMethod,
        required this.versionGroup,
    });

    factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
    };
}

class Sprites {
    final String frontDefault;
    final String frontShiny;
    final Other other;

    Sprites({
        required this.frontDefault,
        required this.frontShiny,
        required this.other,
    });

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        other: Other.fromJson(json["other"]),
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "other": other.toJson(),
    };
}

class Other {
    final DreamWorld dreamWorld;
    final Home home;
    final Home officialArtwork;

    Other({
        required this.dreamWorld,
        required this.home,
        required this.officialArtwork,
    });

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: Home.fromJson(json["official-artwork"]),
    );

    Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
    };
}

class DreamWorld {
    final String frontDefault;

    DreamWorld({
        required this.frontDefault,
    });

    factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
    };
}

class Home {
    final String frontDefault;
    final String frontShiny;

    Home({
        required this.frontDefault,
        required this.frontShiny,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class Stat {
    final int baseStat;
    final int effort;
    final Species stat;

    Stat({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}

class TypePokemon {
    final int slot;
    final Species type;

    TypePokemon({
        required this.slot,
        required this.type,
    });

    factory TypePokemon.fromJson(Map<String, dynamic> json) => TypePokemon(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
    };
}
