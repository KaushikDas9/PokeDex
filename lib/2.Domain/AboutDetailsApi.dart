import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AboutDetailsApi {
  Future<List<dynamic>> getAbout(int id) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$id/";
    List list = [];
    var response = await http.get(Uri.parse(url));

    // if (response.statusCode != 200) {
    //   Get.snackbar("Pokeabout", "error in PokeAbout");
    // } else {
    var body = json.decode(response.body);

    // We are storing Height in first then wight , all type

    list.add(body["height"]);
    list.add(body["weight"]);

    for (int i = 0; i < body["types"].length; i++) {
      list.add(body["types"][i]["type"]["name"]);
    }

    // }
    return list;
  }

  Future<List<dynamic>> getStats(int id) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$id/";
    List list = [];
    var response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);

    // body["stats"]["base_stat"]

    for (int i = 0; i < body["stats"].length; i++) {
      list.add(body["stats"][i]["base_stat"]);
    }

    return list;
  }

  Future<List<List<dynamic>>> getMoves(int id) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$id/";
    List<List<dynamic>> two_type = [];
    List moves = [];
    List moveLearnLevel = [];
    var response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);

    for (int i = 0; i < body["moves"].length; i++) {
      moves.add(body["moves"][i]["move"]["name"]);
      moveLearnLevel.add(
          body["moves"][i]["version_group_details"][0]["level_learned_at"]);
    }
    two_type.add(moves);
    two_type.add(moveLearnLevel);
    print("aakane $two_type");

    return two_type;
  }
}
