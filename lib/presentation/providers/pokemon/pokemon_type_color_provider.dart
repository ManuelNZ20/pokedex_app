import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonTypesProvider = Provider<Map<String,Color>>((ref) {
  return {
    'normal':const Color(0xffd8d8c0),
    'fighting':const Color(0xfff08030),
    'flying':const Color(0xffc8c0f8),
    'poison':const Color(0xffd880b8),
    'ground':const Color(0xFF6F6F06),
    'rock':const Color(0xffe0c068),
    'bug':const Color(0xffd8e030),
    'ghost':const Color(0xffa890f0),
    'steel':const Color(0xffd3d3d3),
    'fire':const Color(0xfff8d030),
    'water':const Color(0xff67d2f1),
    'grass':const Color(0xFF1FB766),
    'electric':const Color(0xFFD2D230),
    'psychic':const Color(0xfff8c0b0),
    'ice':const Color(0xffd0f8e8),
    'dragon':const Color(0xffa06cff),
    'dark':const Color(0xff2b2527),
    'fairy':const Color(0xfff4bdc9),
    'unknown':const Color(0xFF1953B7),
    'shadow':const Color(0xFF7B758E),
  };
});


