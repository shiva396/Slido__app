import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fw);
}

TextStyle textStyle1(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.cantataOne(fontSize: size, color: color, fontWeight: fw);
}

TextStyle ts(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.raleway(fontSize: size, color: color, fontWeight: fw);
}

List Quotes = [
  "H.O.P.E => Hold On Pain Ends",
  "Impossible is just a option",
  "You Only Fail When You Stop Trying",
  "Everything is hard before it is Easy",
  "Yesterday is gone, Future is coming",
  "I Never Dreampt Of Success. I Worked For It",
  "The Trouble is You, You think You Have Time",
  "In POV: Future is your Gift"
];

/*List music = [
  'audio/calmsound1.mp3',
  'audio/calmsound1.mp3',
  'audio/calmsound1.mp3',
  'audio/calmsound1.mp3',
  'audio/calmsound1.mp3',
  'audio/calmsound1.mp3',
];*/
List selectableTimes = [
  "0",
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300"
];

Color renderColor(String currentstate) {
  if (currentstate == "FOCUS") {
    return Color.fromARGB(255, 0, 0, 48);
  } else {
    return Color(0xFF3c59be);
  }
}
