import 'package:flutter/material.dart';
import 'package:slido/utils.dart';
import 'package:slido/widgets/timrservice.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(20, Colors.white, FontWeight.bold),
            ),
            Text(
              "${provider.goal}/12",
              style: textStyle(20, Colors.white, FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "ROUND",
              style: textStyle(20, Colors.white, FontWeight.bold),
            ),
            Text(
              "GOAL",
              style: textStyle(20, Colors.white, FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
