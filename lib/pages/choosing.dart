import 'package:flutter/material.dart';

class Choosing extends StatefulWidget {
  const Choosing({super.key});

  @override
  State<Choosing> createState() => _ChoosingState();
}

class _ChoosingState extends State<Choosing> {
  bool one = false;
  bool two = false;
  bool three = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "You VS Robot",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/main.png",
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          const Text(
            "Choose:",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InputChip(
                  label: const Text(
                    "Rock",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red.shade900,
                  selected: one,
                  onSelected: (value) {
                    setState(
                      () {
                        one = value;
                        Navigator.of(context).pushNamed('/f');
                        one = false;
                        two = false;
                        three = false;
                      },
                    );
                  },
                ),
                InputChip(
                  label: const Text(
                    "Paper",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red.shade900,
                  selected: two,
                  onSelected: (value) {
                    setState(
                      () {
                        two = value;
                        Navigator.of(context).pushNamed('/p');
                        one = false;
                        two = false;
                        three = false;
                      },
                    );
                  },
                ),
                InputChip(
                  label: const Text(
                    "scissor",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red.shade900,
                  selected: three,
                  onSelected: (value) {
                    setState(
                      () {
                        three = value;
                        Navigator.of(context).pushNamed('/s');
                        one = false;
                        two = false;
                        three = false;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
