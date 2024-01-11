import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

class Count3Notifier extends AsyncNotifier<int> {
  final logger = SimpleLogger();
  @override
  FutureOr<int> build() {
    return 0;
  }

  Future<void> log(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 3));

    logger.info(state.toString());
  }

  Future<void> increment(BuildContext context) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      const data = 3;
      return data;
    });
  }

  // Future<void> reset(BuildContext context) async{
  //   await Future.delayed(const Duration(seconds: 3));
  //   state = 0;
  // }
}

final count3Provider = AsyncNotifierProvider<Count3Notifier, int>(Count3Notifier.new);

