import 'package:flutter/material.dart';
import 'package:slido/utils.dart';
import 'package:blockquote/blockquote.dart';

class quoter extends StatelessWidget {
  const quoter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Quote Time",
            style: textStyle1(23, Colors.white, FontWeight.w200),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF439dab),
                Color(0xFFb576c2),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: ListView(scrollDirection: Axis.vertical, children: [
              SizedBox(
                height: 7,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blue,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"If poeple are not laughing at your goals, your goals are too small.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Azim Premji',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"Reading an hour a day is only 4% of your day. But that 4% will put you at the top of your field within 10 years. Find the time.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Patrick Bet-David',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"If you're serious about changing your life, you'll find a way. If not you'll find an excuse.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Jin Sincero',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"Procastination will delay your dreams.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Vex King',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"If it isn't a clear yes, then it's a clear no.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Greg McKeown',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"You are what you eat and read.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Maya Corrigan',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"Only staying active will make you want to live a hundred years.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    Text(
                      '~Japanese Proverb',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"Some people die at 25 abd aren't buried until 75.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '~Benjamin Franklin',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlockQuote(
                outerPadding: const EdgeInsets.all(20),
                blockColor: Colors.blueAccent,
                blockWidth: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "\"Do whatever it takes as long as long as it takes.\"",
                      textAlign: TextAlign.justify,
                      style: ts(17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '~Balaji Rajendran',
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ])));
  }
}
