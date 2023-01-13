import 'package:flutter/material.dart';
import 'package:slido/utils.dart';
import 'package:slido/widgets/timrservice.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  //double selectedTime = 1500;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 230),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: selectableTimes.map((time) {
        return InkWell(
          onTap: ()=>provider.selectTime(double.parse(time)),
          child: Container(
            margin: EdgeInsets.only(left: 8),
            width: 70,
            height: 40,
            decoration: int.parse(time) == provider.selectedTime
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white30),
                    borderRadius: BorderRadius.circular(5),
                  ),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: textStyle(
                    20,
                    int.parse(time) == provider.selectedTime
                        ? renderColor(provider.currentstate)
                        : Colors.white,
                    FontWeight.w700),
              ),
            ),
          ),
        );
      }).toList()),
    );
  }
}
