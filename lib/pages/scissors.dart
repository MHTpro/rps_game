import 'dart:math';
import 'package:flutter/material.dart';

class Scissor extends StatefulWidget {
  const Scissor({super.key});

  @override
  State<Scissor> createState() => _ScissorState();
}

class _ScissorState extends State<Scissor> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  Random randomNumber = Random();
  late int robotChoise;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      value: 0.0,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    controller.forward();
    Future.delayed(
      Duration.zero,
    );
    robotChoise = randomNumber.nextInt(3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //create robot
  Widget robot() {
    if (robotChoise == 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
        child: FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: Image.asset("assets/images/rock.png"),
          ),
        ),
      );
    } else if (robotChoise == 1) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
        child: FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: Image.asset("assets/images/paper.png"),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
        child: FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: Image.asset("assets/images/scissors.png"),
          ),
        ),
      );
    }
  }

  Widget robotText() {
    if (robotChoise == 0) {
      return const Text(
        "Robot choosed Rock",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (robotChoise == 1) {
      return const Text(
        "Robot choosed Paper",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return const Text(
        "Robot choosed Scissor",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  //count down
  int count = 0;
  String? end;
  Stream<int> countDown() async* {
    final navigator = Navigator.of(context);
    while (count < 6) {
      await Future.delayed(const Duration(seconds: 1));
      yield count++;
    }
    if (robotChoise == 0) {
      end = 'YOU LOSE';
      navigator.pushNamed("/es", arguments: end);
    } else if (robotChoise == 1) {
      end = "YOU WIN";
      navigator.pushNamed("/es", arguments: end);
    } else if (robotChoise == 2) {
      end = "TIE";
      navigator.pushNamed("/es", arguments: end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: countDown(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  robot(),
                  robotText(),
                  Divider(
                    color: Colors.red.shade900,
                    height: 5.0,
                    thickness: 5.0,
                  ),
                  const Text(
                    "You choosed Scissor",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: Image.asset("assets/images/scissors.png"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class Ends extends StatefulWidget {
  const Ends({super.key});

  @override
  State<Ends> createState() => _EndsState();
}

class _EndsState extends State<Ends> {
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              argument,
              style: TextStyle(
                fontSize: 70.0,
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/ch");
              },
              child: const Text(
                "Again",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
