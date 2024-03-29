import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pokedex_app/1.Application/AboutPagePokemonDetails/AboutDetails.dart';
import 'package:pokedex_app/1.Application/AboutPagePokemonDetails/EvolationDetails.dart';
import 'package:pokedex_app/1.Application/AboutPagePokemonDetails/MovesDetails.dart';
import 'package:pokedex_app/1.Application/AboutPagePokemonDetails/StatDetails.dart';
import 'package:pokedex_app/2.Domain/AboutDetailsApi.dart';
import 'package:pokedex_app/2.Domain/pokeApi.dart';
import 'package:pokedex_app/Utils/String/allString.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonAbout extends StatefulWidget {
  int number;
  String name;
  PokemonAbout({required this.number, required this.name, super.key});

  @override
  State<PokemonAbout> createState() => pokemonAboutState();
}

class pokemonAboutState extends State<PokemonAbout> {
  var _imageUrl = "";
  RxInt li = 0.obs;
  RxList listAbout = [].obs;
  List<Widget> PageList = [];
  RxList aboutList = [].obs;
  RxList aboutStats = [].obs;
  RxList aboutMoves = [].obs;
  RxList aboutMovesLearnedLevel = [].obs;

  //Here We calling all api
  Future getPokemonImage() async {
    _imageUrl = await PokeApi().getOnePokemonImage(widget.number);

    setState(() {
      print("2" + "  " + _imageUrl);
    });
  }

  Future getAbout() async {
    aboutList.value = await AboutDetailsApi().getAbout(widget.number);
  }

  Future getStats() async {
    aboutStats.value = await AboutDetailsApi().getStats(widget.number);
  }

  Future getMoves() async {
    List<List<dynamic>> getList = [];
    getList = await AboutDetailsApi().getMoves(widget.number);

    aboutMoves.value = getList[0];
    aboutMovesLearnedLevel.value = getList[1];
  }

  @override
  void initState() {
    super.initState();
    getPokemonImage();
    getAbout();
    getStats();
    getMoves();
    PageList = [
      AboutDetails(list: aboutList, number: widget.number),
      StatDetails(list: aboutStats),
      const EvolutionsDetails(),
      MoveDetails(
        moves: aboutMoves,movesLearn: aboutMovesLearnedLevel,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          //This is contains Pokemon Image
          backgroundColor: Colors.red,
          pinned: true,
          centerTitle: true,
          expandedHeight: height * .4,
          floating: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Ionicons.arrow_back_sharp)),
          flexibleSpace: FlexibleSpaceBar(
              background: _imageUrl == ""
                  ? Center(
                      child: SizedBox(
                          height: height * .09,
                          width: width * .18,
                          child: const CircularProgressIndicator()))
                  : SvgPicture.network(
                      _imageUrl,
                      fit: BoxFit.scaleDown,
                    )),
        ),
        SliverToBoxAdapter(
          //This Box contains only The Pokemon Name
          child: Container(
            height: 50,
            width: width,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              widget.name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          //This Box contains only The pokeMon ALL stats Details Horizontal list
          child: Obx(() => Container(
              height: height * .07,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 30, top: 15),
                children: [
                  InkWell(
                    onTap: () async {
                      li.value = 0;
                    },
                    child: Container(
                      decoration: li.value == 0
                          ? const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.black, width: 2),
                            ))
                          : const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            )),
                      height: 10,
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 7),
                      child: Text(AllString().about),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      li.value = 1;
                    },
                    child: Container(
                      decoration: li.value == 1
                          ? const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.black, width: 2),
                            ))
                          : const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            )),
                      height: 200,
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 7),
                      child: Text(AllString().stats),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      li.value = 2;
                    },
                    child: Container(
                      decoration: li.value == 2
                          ? const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.black, width: 2),
                            ))
                          : const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            )),
                      height: 200,
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 7),
                      child: Text(AllString().evolution),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      li.value = 3;
                    },
                    child: Container(
                      decoration: li.value == 3
                          ? const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.black, width: 2),
                            ))
                          : const BoxDecoration(
                              border: BorderDirectional(
                              bottom: BorderSide(color: Colors.grey, width: 2),
                            )),
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 7),
                      height: 200,
                      child: Text(AllString().moves),
                    ),
                  ),
                ],
              ))),
        ),
        Obx(
          () => SliverToBoxAdapter(
            child: Container(
              height: height * .45,
              child: PageList[li.value],
            ),
          ),
        )
      ]),
    );
  }
}
