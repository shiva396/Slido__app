import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Music_list extends StatelessWidget {
  const Music_list({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              controller: null,
              child: Row(
                children: [],
              ),
            ),
          ));
        },
        child: Icon(Icons.music_note));
  }
}
