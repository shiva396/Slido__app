import 'package:flutter/material.dart';
import 'package:slido/onboard/pagez.dart';
import 'package:slido/screen.dart';
import 'package:provider/provider.dart';
import 'package:slido/widgets/timrservice.dart';
import 'package:slido/widgets/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

int?initScreen=0;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(
      ChangeNotifierProvider<TimerService>(
      create: (_) => TimerService(),
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoubleBack( 
        message: "Press back again to close",
        child: initScreen==0||initScreen==null?OnboardingPage():splash()
      ),
    );
  }
}
