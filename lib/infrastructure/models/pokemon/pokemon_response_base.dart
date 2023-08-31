
class PokemonResponseBase {
    final int count;
    final List<ResultBase> results;

    PokemonResponseBase({
        required this.count,
        required this.results,
    });

    factory PokemonResponseBase.fromJson(Map<String, dynamic> json) => PokemonResponseBase(
        count: json["count"],
        results: List<ResultBase>.from(json["results"].map((x) => ResultBase.fromJson(x))),
    );

}

class ResultBase {
    final String name;
    final String url;

    ResultBase({
        required this.name,
        required this.url,
    });

    factory ResultBase.fromJson(Map<String, dynamic> json) => ResultBase(
        name: json["name"],
        url: json["url"],
    );
}
