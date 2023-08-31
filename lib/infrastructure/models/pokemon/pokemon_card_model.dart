import 'package:pokedex_app/infrastructure/models/models.dart';

class PokemonCardModel {
    final int id;
    final String name;
    final String spritesFrontDefault;
    final List<TypeModel> types;

    PokemonCardModel({
        required this.id,
        required this.name,
        required this.spritesFrontDefault,
        required this.types,
    });

    factory PokemonCardModel.fromJson(Map<String, dynamic> json) => PokemonCardModel(
        id: json["id"],
        name: json["name"],
        spritesFrontDefault: json["sprites"]["front_default"],
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sprites": spritesFrontDefault,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
    };
}
