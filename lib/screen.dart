import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slido/widgets/playit.dart';
import 'package:slido/widgets/service.dart';
import 'package:slido/widgets/timecontroller.dart';
import 'package:slido/widgets/timeoptions.dart';
import 'package:slido/widgets/timrservice.dart';
import 'package:provider/provider.dart';
import 'utils.dart';
import 'package:slido/widgets/timercard.dart';
import 'package:slido/widgets/progress.dart';
import 'package:slido/widgets/chess.dart';
import 'package:slido/widgets/quotecontroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:slido/widgets/Side.dart';
import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PromodoroScreen extends StatefulWidget {
  @override
  State<PromodoroScreen> createState() => _PromodoroScreenState();
}

class _PromodoroScreenState extends State<PromodoroScreen> {
  BannerAd? _banner;
  @override
  void initState() {
    super.initState();

    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

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
                    height: 30,
                    width: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          PlayPauseButton(),
                          SizedBox(
                              child: Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 242, 236, 235),
                            highlightColor: Color.fromARGB(187, 218, 218, 218),
                            enabled: true,
                            loop: 10,
                            child: Text(
                              '-> Lofi beats',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )), //Text(" =>Calm sounds (lofi beats)",style: textStyle(17,Colors.white,),),
                        ],
                      ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: _banner == null
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 60,
                  child: AdWidget(ad: _banner!),
                )),
    );
  }
}
