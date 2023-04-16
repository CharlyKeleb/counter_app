import 'package:get/get.dart';

class TapRecorderController extends GetxController {
  var tapCount = 0.obs;
  List tapTimes = <double>[].obs;
  //boolean to determine when the function is executing
  //so it can help us switch colors
  var isExecuting = false.obs;


  //increment the count while user taps
  void incrementCount() {
    tapCount++;
  }

  //record delays
  void recordTap() {
    final now = DateTime.now().microsecondsSinceEpoch / 1000000.0;
    tapTimes.add(now);

  }

  //this function simulates the taps in respect to their
  //delay intervals
  Future<void> executeTaps() async {
    isExecuting.value = true;
    for (var i = 0; i < tapTimes.length; i++) {
      final delay = tapTimes[i] - (i > 0 ? tapTimes[i - 1] : tapTimes[i]);
      await Future.delayed(Duration(milliseconds: (delay * 1000).toInt()));
      incrementCount();

    }
    tapTimes.clear();
    isExecuting.value = false;

  }

  /*
  In this code, we created a TapRecorderController class that extends GetxController.
  It has two observables - _tapCount and _tapTimes - which we can access using the tapCount and tapTimes getters.
  We also defined three methods - incrementCount, recordTap, and executeTaps -
   */
}
