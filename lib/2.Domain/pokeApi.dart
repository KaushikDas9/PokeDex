import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class PokeApi {
  Future getPokemon(
      {String? url, required RxList names, required RxList urls}) async {
    var response =
        await http.get(Uri.parse(url ?? "https://pokeapi.co/api/v2/pokemon/"));
    var body = json.decode(response.body);
    print(2);
    for (int i = 0; i < body["results"].length; i++) {
      print(3);
      names.add(body["results"][i]["name"] ?? "None");
      urls.add(body["results"][i]["url"] ?? "None");
    }
  }

  Future<String> getOnePokemonImage(int number) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$number/";

    var responce = await http.get(Uri.parse(url));
    var body = json.decode(responce.body);
  
    return body["sprites"]["other"]["dream_world"]["front_default"];
  }

  Future<RxList> getListOfPokemonImage(RxList pokemon, int number) async {
    for (int i = 1; i <= 20; i++) {
      String url = "https://pokeapi.co/api/v2/pokemon-form/${number + i}/";
      var responce = await http.get(Uri.parse(url));
      var body = json.decode(responce.body);
      pokemon.add(body["sprites"]["front_default"]);
    }
    return pokemon;
  }
}
