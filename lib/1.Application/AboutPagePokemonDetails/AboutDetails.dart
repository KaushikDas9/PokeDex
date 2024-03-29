// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/Utils/String/allString.dart';

class AboutDetails extends StatefulWidget {
  RxList<dynamic> list = [].obs;
  int number;
  AboutDetails({required this.list, required this.number, super.key});

  @override
  State<AboutDetails> createState() => _AboutDetailsState();
}

class _AboutDetailsState extends State<AboutDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() => Container(
          // height: Get.height * .5,
          margin: const EdgeInsets.only(left: 35, top: 25),
          child: widget.list.isEmpty
              ? const Visibility(
                  child: Center(child: CircularProgressIndicator()))
              : Column(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 45),
                    width: width,
                    child: Center(child: Text("#${widget.number}")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          width: width * .3,
                          child: Row(
                            children: [
                              Text(
                                "${AllString().height} : ",
                                style: const TextStyle(color: Colors.black26),
                              ),
                              Text(widget.list[0].toString())
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Container(
                          width: width * .4,
                          child: Row(
                            children: [
                              Text("${AllString().weight} : ",
                                  style:
                                      const TextStyle(color: Colors.black26)),
                              Text(widget.list[1].toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    child: Row(
                      children: [
                        Text("${AllString().type} :",
                            style: const TextStyle(color: Colors.black26)),
                        Text( widget.list[2].toString()) 
                      ],
                    ),
                  ),
                ]),
        ));
  }
}
