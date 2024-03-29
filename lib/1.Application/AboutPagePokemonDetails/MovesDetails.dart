import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoveDetails extends StatefulWidget {
  RxList moves = [].obs;
  RxList movesLearn = [].obs;
  MoveDetails({required this.moves, required this.movesLearn, super.key});

  @override
  State<MoveDetails> createState() => _MoveDetailsState();
}

class _MoveDetailsState extends State<MoveDetails> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.movesLearn.isEmpty ? const Center(child: CircularProgressIndicator(),) : Container(
          padding: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            itemCount: widget.movesLearn.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${index + 1} "),
                title: Text(widget.moves[index].toString().toUpperCase()),
                horizontalTitleGap: 0,
                subtitle: Text("Level Learned at ${widget.movesLearn[index].toString()}"),
              );
            },
          ),
        ));
  }
}
