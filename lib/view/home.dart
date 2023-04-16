import 'package:flutter/material.dart';

///This the representation of the test without GetX in a stateless widget

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //we create an integer to record the number of taps
  int tapCount = 0;
  //we created a List of double delay timer of taps
  List<double> tapTimes = [];

  //increment the tapCount when a button is pressed
  void _incrementCount() {
    setState(() {
      tapCount++;
    });
  }

  //record the delay between each taps
  void _recordTap() {
    final now = DateTime.now().microsecondsSinceEpoch / 1000000.0;
    tapTimes.add(now);
  }

  //this function simulates the taps in respect to their
  //delay intervals
   void _executeTaps() async {
    for (var i = 0; i < tapTimes.length; i++) {
      final delay = tapTimes[i] - (i > 0 ? tapTimes[i - 1] : tapTimes[i]);
      await Future.delayed(Duration(milliseconds: (delay * 1000).toInt()));
      _incrementCount();
    }
    tapTimes.clear();
  }

  /*
  we used setState to manage the state of Taps
   */
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Number of taps:',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              '$tapCount',
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onLongPress: _executeTaps,
        child: FloatingActionButton(
          onPressed: _recordTap,
          backgroundColor: tapTimes.isNotEmpty ? Colors.red : Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
