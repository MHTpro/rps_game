import 'dart:math';
import 'package:flutter/material.dart';

class Battle extends StatefulWidget {
  const Battle({super.key});

  @override
  State<Battle> createState() => _BattleState();
}

class _BattleState extends State<Battle> with SingleTickerProviderStateMixin {
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
      end = 'TIE';
      navigator.pushNamed("/e", arguments: end);
    } else if (robotChoise == 1) {
      end = "YOU LOSE";
      navigator.pushNamed("/e", arguments: end);
    } else if (robotChoise == 2) {
      end = "YOU WIN";
      navigator.pushNamed("/e", arguments: end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: countDown(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  robot(),
                  robotText(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Divider(
                      color: Colors.red.shade900,
                      height: 5.0,
                      thickness: 5.0,
                    ),
                  ),
                  const Text(
                    "You choosed Rock",
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
                        child: Image.asset("assets/images/rock.png"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class End extends StatefulWidget {
  const End({super.key});

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
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
