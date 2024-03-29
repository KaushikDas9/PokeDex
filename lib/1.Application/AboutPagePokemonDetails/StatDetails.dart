import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatDetails extends StatefulWidget {
  RxList list = [].obs;
  StatDetails({required this.list, super.key});

  @override
  State<StatDetails> createState() => _StatDetailsState();
}

class _StatDetailsState extends State<StatDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Obx(() => Container(
          margin: EdgeInsets.only(
              left: height * .04, right: width * .03, top: height * .02),
          child: widget.list.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Hp       "),
                      Text("${widget.list[0]}"),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10.0,
                        percent: ((widget.list[0] + 0.0)  ) > 100 ? 1.0 : ((widget.list[0] + 0.0) / 100 ),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Att      "),
                      Text(widget.list[1].toString()),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10,
                        percent: ((widget.list[1] + 0.0) ) > 100
                            ? 1.0
                            : ((widget.list[1] + 0.0) / 100),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Def     "),
                      Text(widget.list[2].toString()),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10,
                        percent: ((widget.list[2] + 0.0) ) > 100
                            ? 1.0
                            : ((widget.list[2] + 0.0) / 100),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("S.Att  "),
                      Text(widget.list[3].toString()),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10,
                        percent: ((widget.list[3] + 0.0) ) > 100
                            ? 1.0
                            : ((widget.list[3] + 0.0) / 100),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("S.Def "),
                      Text(widget.list[4].toString()),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10,
                        percent: ((widget.list[4] + 0.0) ) > 100
                            ? 1.0
                            : ((widget.list[4] + 0.0) / 100),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Speed"),
                      Text(widget.list[5].toString()),
                      LinearPercentIndicator(
                        width: width * .5,
                        lineHeight: 10,
                        percent: ((widget.list[5] + 0.0) ) > 100
                            ? 1.0
                            : ((widget.list[5] + 0.0) / 100),
                        animation: true,
                        animationDuration: 1500,
                        clipLinearGradient: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                ]),
        ));
  }
}
