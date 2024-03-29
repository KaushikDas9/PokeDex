import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomWidget {
  Widget myhomePageCard(String name, String images, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.08),
      ),
      child: Stack(children: [
        Image.network(
          images,
          fit: BoxFit.cover,
        ),
        Positioned( bottom: 0,  child: Container( width:25,color: Colors.amber, ))
      ]),
    );
  }
}
