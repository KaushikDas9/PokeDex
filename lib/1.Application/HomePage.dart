// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:pokedex_app/1.Application/PokeAboutPage.dart';
import 'package:pokedex_app/2.Domain/pokeApi.dart';
import 'package:pokedex_app/Utils/Customwidget/CustomWidget.dart';
import 'package:pokedex_app/Utils/String/allString.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _PokemonNumber = 0.obs;
  final RxList _pokemonNames = [].obs;
  final RxList _pokemonUrls = [].obs;
  final RxList _pokemonImages = [].obs;

  pokemonNameList({String? url}) async {
    // if (_pokemonNames.isEmpty) {
      print(1);
      await PokeApi().getPokemon(url: url ,names: _pokemonNames, urls: _pokemonUrls);
    // }
  }

  pokemonImageList({int? number }) async {
    // if (_pokemonNames.isEmpty) {
      await PokeApi().getListOfPokemonImage(_pokemonImages, number ?? 0);
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pokemonNameList();
    pokemonImageList();
    _PokemonNumber = 0.obs;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(AllString().appBarName) , centerTitle: true, ),
      body: SingleChildScrollView(
        // physics:const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height * .05,
            ),
            Container(
              width: width * .9,
              height: height * .08,
              child: TextField(
                controller: searchController,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Ionicons.search_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Padding(
                padding: EdgeInsets.only(left: width * .04, right: width * .04),
                child: Obx(
                  () => _pokemonNames.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _pokemonImages.length - _PokemonNumber.value,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: width * 0.02,
                                  mainAxisSpacing: height * 0.02),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PokemonAbout(
                                            number: _PokemonNumber.value + index + 1,
                                            name: _pokemonNames[index + _PokemonNumber.value]),
                                      ));
                                },
                                child: MyCustomWidget().myhomePageCard(
                                    _pokemonNames[index],
                                    _pokemonImages[index+_PokemonNumber.value],
                                    context));
                          },
                        ),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() =>  Visibility(
                  visible: _pokemonImages.length < 21  || _PokemonNumber.value == 0? false : true ,
                    child: ElevatedButton(
                        onPressed: () {
                          _PokemonNumber = _PokemonNumber - 20;
                           String nextPage =
                              "https://pokeapi.co/api/v2/pokemon/?offset=${_PokemonNumber}&limit=20";
                          // _pokemonNames.clear();
                          // _pokemonImages.clear();
                          // pokemonNameList(url: nextPage);
                          // pokemonImageList(number: _PokemonNumber.value);
                        },
                        child: Text(AllString().previous)),
                  ),),
                  ElevatedButton(
                      onPressed: () async {
                        _PokemonNumber = _PokemonNumber + 20;
                        String nextPage =
                            "https://pokeapi.co/api/v2/pokemon/?offset=${_PokemonNumber}&limit=20";
                        // _pokemonNames.clear();
                        // _pokemonImages.clear();
                         pokemonNameList(url: nextPage);

                        pokemonImageList(number: _PokemonNumber.value);
                      },
                      child: Text(AllString().next))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
