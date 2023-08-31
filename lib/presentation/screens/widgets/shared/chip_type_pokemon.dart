import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/presentation/providers/pokemon/pokemon_type_color_provider.dart';

class ChipTypePokemon extends ConsumerWidget {
  final String nameType;
  final double? width;
  final double height;
  const ChipTypePokemon({super.key,required this.nameType, this.width, required this.height, });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTypePokemon = ref.watch(pokemonTypesProvider);

    final colorTheme = Theme.of(context).colorScheme.onSecondary.withOpacity(.12);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: height/10.5, horizontal: 7.5),
      decoration: BoxDecoration(
          color: nameType.isNotEmpty?colorTypePokemon[nameType]!.withOpacity(.2):colorTheme,
          borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(right: 10),
      child: Center(
        child: Text(
          nameType,
          style: TextStyle(color: colorTypePokemon[nameType]),
        ),
      ),
    );
  }
}
