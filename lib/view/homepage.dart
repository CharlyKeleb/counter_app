import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_test/view_model/tap_controller.dart';

///This the representation of the test with GetX in a stateless widget
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  /*
  Here, we are using GetX to manage the state of the Home widget.
   We are using HomeController to manage the state of the widget.
   We define HomeController with GetX and put it into the widget tree using Get.put()
   */
  final controller = TapRecorderController();

  @override
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
          //tap counter
          Center(
            child: Obx(
              () => Text(
                '${controller.tapCount}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        //simulate taps when on long pressed
        onLongPress: controller.executeTaps,
        child: Obx(
          () => FloatingActionButton(
            //record taps when the button is pressed.
            onPressed: controller.recordTap,
            //switched colors when function executes
            backgroundColor: controller.isExecuting.value
                ? Colors.primaries[Random().nextInt(16)]
                : Colors.blue,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
