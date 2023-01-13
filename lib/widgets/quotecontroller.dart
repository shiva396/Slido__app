import 'package:flutter/material.dart';
import 'package:slido/utils.dart';
import 'dart:math';

class QuoteShow extends StatelessWidget {
  const QuoteShow({super.key});

  @override
  Widget build(BuildContext context) {
    var randomItem = (Quotes..shuffle()).first;
    return SingleChildScrollView(
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19,vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 151, 93, 162).withOpacity(.4),
                    Color.fromARGB(255, 151, 93, 162).withOpacity(.2)
                  ]),
          ),
          
          child: Text(randomItem,style: textStyle1(15,Colors.white,FontWeight.w600),),
        ),
      ),
    );
  }
}
