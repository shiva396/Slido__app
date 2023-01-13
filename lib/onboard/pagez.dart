import 'package:slido/main.dart';
import 'package:slido/onboard/cardz.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slido/onboard/cardz.dart';
import 'package:slido/screen.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "Keep Track of Your task",
      subtitle:
          "Trace your timing of doing a task.",
      image: AssetImage('assets/images/worktask3.png'),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/blue.json"),
    ),
    CardPlanetData(
      title: "Have calmsound",
      subtitle: "LoFi make you feel good",
      image: AssetImage('assets/images/listenmusic.png'),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animation/blue.json"),
    ),
    CardPlanetData(
      title: "Games at boring time",
      subtitle: "Try chess and brain games..",
      image: const AssetImage("assets/images/games.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/blue.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PromodoroScreen()),
          );
        },
      ),
    );
  }
}
