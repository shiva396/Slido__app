import 'dart:io';

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:slido/screen.dart';
import 'package:slido/widgets/chess.dart';
import 'package:slido/widgets/quotelang.dart';
import 'package:slido/widgets/xogame.dart';
import 'package:url_launcher/url_launcher.dart';

class Side extends StatefulWidget {
  const Side({super.key});

  @override
  State<Side> createState() => _SideState();
}

class _SideState extends State<Side> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 116, 52, 124),
                Color.fromARGB(255, 0, 0, 48),
              ],
              stops: [
                0.7,
                0.9
              ])),
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            SizedBox(
              width: 35,
            ),
            Column(
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 80,
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => PromodoroScreen()));
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PlayChess()));
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.games_rounded, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Chess",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => quoter()));
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.read_more, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Quote",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.games, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "XO game",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
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
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.person, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "About",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              LaunchReview.launch(
                androidAppId: "com.softrate.android.app",
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.rate_review, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Rate us",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Wanna Exit?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pop(context, false), // passing false
                          child: Text('No'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () => exit(0), // passing true
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  }).then((exit) {
                if (exit == null) return;
              });
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.exit_to_app, color: Colors.white, size: 20),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Exit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                'assets/images/softrate.png',
                height: 50,
                width: 120,
              ),
              const Text(
                'Softrate India',
                style: TextStyle(color: Colors.white),
              ),
              const Text('®All rights Reserved',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
