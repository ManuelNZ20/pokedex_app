class PokemonResponse {
    final int count;
    final List<Result> results;

    PokemonResponse({
        required this.count,
        required this.results,
    });

}

class Result {
    final String name;
    final String url;

    Result({
        required this.name,
        required this.url,
    });
}
