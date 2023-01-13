import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:slido/widgets/playme.dart';
import 'package:slido/widgets/timecontroller.dart';
import 'package:slido/widgets/timeoptions.dart';
import 'package:slido/widgets/timrservice.dart';
import 'package:provider/provider.dart';
import 'utils.dart';
import 'package:slido/widgets/timercard.dart';
import 'package:slido/widgets/progress.dart';
import 'package:slido/widgets/chess.dart';
import 'package:audioplayers/src/audio_cache.dart';
import 'package:slido/widgets/audiooptions.dart';
import 'package:slido/widgets/quotecontroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:slido/widgets/Side.dart';
import 'package:slido/widgets/play.dart';
import 'dart:async';

class PromodoroScreen extends StatefulWidget {
  @override
  State<PromodoroScreen> createState() => _PromodoroScreenState();
}

class _PromodoroScreenState extends State<PromodoroScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return DoubleBack(
      message: "Do again to exit",
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: renderColor(provider.currentstate),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "SLIDO",
            style: textStyle(25, Colors.white, FontWeight.w300),
          ),
          actions: [
            Container(
              child: GestureDetector(
                onTap: () async {
                  var url = "https://softrateindia.com/";

                  if (await launch(url)) {
                    await launch(
                      url,
                      enableJavaScript: true,
                    );
                  }
                },
                child: Container(
                  child: Image.asset(
                    'assets/images/softrate.png',
                    height: 70,
                    width: 50,
                    scale: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Container(
              child: Drawer(
                child: Side(),
              ),
            )),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: const QuoteShow(),
                ),
                const SizedBox(
                  height: 30,
                ),
                TimerCard(),
                const SizedBox(
                  height: 35,
                ),
                TimeOptions(),
                const SizedBox(
                  height: 40,
                ),
                TimeController(),
                const SizedBox(
                  height: 20,
                ),
                ProgressWidget(),
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Playme(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
