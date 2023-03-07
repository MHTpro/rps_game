import 'package:flutter/material.dart';
import 'package:test_flutter_app/pages/paper.dart';
import 'package:test_flutter_app/pages/scissors.dart';
import './pages/rock.dart';
import 'package:test_flutter_app/pages/choosing.dart';
import 'package:test_flutter_app/pages/load_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (context) => const LoadPage(),
        "/ch": (context) => const Choosing(),
        "/f": (context) => const Battle(),
        "/p": (context) => const Paper(),
        "/s": (context) => const Scissor(),
        "/e": (context) => const End(),
        "/ep": (context) => const Endp(),
        "/es": (context) => const Ends(),
      },
    );
  }
}
