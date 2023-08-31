import 'package:pokedex_app/domain/domain.dart';

class PokemonCard {
  
  final int id;
  final String name;
  final List<TypePokemon> types;
  final String spritesFrontDefault;

  PokemonCard({required this.id, required this.name, required this.types, required this.spritesFrontDefault});

}
