import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:slido/screen.dart';
import 'package:slido/onboard/pagez.dart';

import '../main.dart';
// import 'package:page_transition/page_transition.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splashIconSize: MediaQuery.of(context).size.height,
        splash: Column(
          children: [
            SizedBox(height: 150,),
            Image.asset('assets/images/slido.png',height: 200,width: 150,),
            SizedBox(height: 17,),
            Text("SLIDO"),
            SizedBox(height: 200,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'from',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/softrate.png',
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    Text(
                      'SOFTRATE',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                      width: 0,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(seconds: 1),
        duration: 1500,
        backgroundColor: Colors.grey.shade50,
        nextScreen: PromodoroScreen(),
      ),
    );
  }
}
