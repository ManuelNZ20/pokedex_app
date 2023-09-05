import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/domain.dart';
import 'package:pokedex_app/presentation/screens/pokemon/pokemon_details_screen.dart';

class InformationPokemonBuilder extends StatelessWidget {
  final Pokemon pokemon;
  final String information;
  const InformationPokemonBuilder({super.key, required this.pokemon,required this.information});

  @override
  Widget build(BuildContext context) {
    final colorThemeTitle =
        Theme.of(context).colorScheme.onSurface.withOpacity(.3);
    return StreamBuilder(
      stream: Stream.empty(),
      initialData: pokemon,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ContainerInfoLoading(colorThemeTitle: colorThemeTitle);
        }
        return Text(information);
      },
    );
  }
}
