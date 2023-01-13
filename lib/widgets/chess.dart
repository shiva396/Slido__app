import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart';
import 'package:slido/widgets/utilschess.dart';
import 'package:slido/utils.dart';

class PlayChess extends StatefulWidget {
  @override
  _PlayChessState createState() => _PlayChessState();
}

class _PlayChessState extends State<PlayChess> {
  String _fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    final size = min(viewport.height, viewport.width);

    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
      
          centerTitle: false,
          elevation: 0,
          title: Text("Chess",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black26,
                Colors.white,
                Colors.black,
                Colors.white,
              ],
              stops: [
                0.11,
                0.09,
                0.6,
                0.83,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                    child: Text(
                  "AI",
                  style: TextStyle(fontSize: 50),
                )),
                SizedBox(
                  height: 30,
                ),
                Chessboard(
                  darkSquareColor: Colors.black26,
                  lightSquareColor: Colors.white,
                  fen: _fen,
                  size: size,
                  onMove: (move) {
                    final nextFen = makeMove(_fen, {
                      'from': move.from,
                      'to': move.to,
                      'promotion': 'q',
                    });
        
                    if (nextFen != null) {
                      setState(() {
                        _fen = nextFen;
                      });
        
                      Future.delayed(Duration(milliseconds: 200)).then((_) {
                        final nextMove = getRandomMove(_fen);
        
                        if (nextMove != null) {
                          setState(() {
                            _fen = makeMove(_fen, nextMove) ?? _fen;
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Victory"),
                                  content: const Text(
                                      "You won the Match!"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        color: Colors.blue.shade200,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("Okay"),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Text(
                  "YOU",
                  style: TextStyle(fontSize: 50),
                )),
              ],
            ),
          ),
        ));
  }
}
