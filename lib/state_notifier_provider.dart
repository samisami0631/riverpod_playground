import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountNotifier extends StateNotifier<int> {
  CountNotifier() : super(0);

  void increment() {
    state++;
  }

  void reset(){
    state = 0;
  }
}

final countProvider = StateNotifierProvider<CountNotifier, int>((ref){
    return CountNotifier();
  }
);
