class pokeModel {
  late String? count;
  late String? next;
  late String? previous;
  late List<dynamic>? pokemonName;
  late List<dynamic>? pokemonDetailsUrl;

  pokeModel(
      {this.count,
      this.next,
      this.previous,
      this.pokemonName,
      this.pokemonDetailsUrl});

  pokeModel fromJson(Map<String, dynamic> map) {
    return pokeModel(
        count: map["count"].toString(),
        next: map["next"].toString(),
        previous: map["previous"].toString(),
        pokemonName: _getPokemonNameList(map["results"]),
        pokemonDetailsUrl: _getPokemonDetailsUrl(map["results"]));
  }

  List<dynamic> _getPokemonNameList(List<dynamic> pokemonList) {
    // List<Map<String,String >> pokemonList = pokemon as List<Map<String,String>>;
    List<dynamic> list = [];

    for (int i = 0; i < pokemonList.length; i++) {
      var temp = pokemonList[i];
      list.add(temp["name"] ?? "none");
    }

    return list;
  }

  List<dynamic> _getPokemonDetailsUrl(List<dynamic> pokemonList) {
    List<dynamic> list = [];

    for (int i = 0; i < pokemonList.length; i++) {
      var temp = pokemonList[i];
      list.add(temp["url"] ?? "none");
    }
    return list;
  }
}


