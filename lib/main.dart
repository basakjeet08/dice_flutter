import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}
/// This is a Stateful Widget which can change state like changing Images or texts or any
/// UI resources and these can't be accomplished normally by a stateless Widget which does
/// not allow us to change the State.
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  // Passing the State of the Widget to its Parent Stateful Widget and linking the state to it.
  @override
  State<DicePage> createState() => _DicePageState();
}

/// It is the state of the Above widget which basically holds all the stateful work like changing
/// the UI accordingly
class _DicePageState extends State<DicePage> {

  // Declaring the dice Count for left and right Dice
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  // This function sets the New Dice variables to change the dice Images
  void setDiceNumbers() {

    // SetState method calls the build method again and draws all the changes done
    setState(() {

      // Random().nextInt(6) gives a random number between 0 to 5
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          // It Expands the Image to take the whole Screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  setDiceNumbers();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  setDiceNumbers();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
