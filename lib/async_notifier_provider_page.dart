import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/other_async_notifier_provider_page.dart';
import 'package:simple_logger/simple_logger.dart';

class AsyncNotifierProviderPage extends ConsumerWidget {
  const AsyncNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueInt = ref.watch(count3Provider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('AsyncNotifierProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(asyncValueInt.toString()),
            asyncValueInt.when(
              error: (err, _) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
              data: (data) => Text(data.toString()),
            ),
            TextButton(
              onPressed: () {
                ref.read(count3Provider.notifier).to3(context);
              },
              child: const Text('to3'),
            ),
            TextButton(
              onPressed: () {
                ref.read(count3Provider.notifier).log(context);
              },
              child: const Text('log'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherAsyncNotifierProviderPage(),
                  ),
                );
              },
              child: const Text('OtherAsyncNotifierProviderPage'),
            ),
          ],
        ),
      ),
    );
  }
}

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

  Future<void> to3(BuildContext context) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      const data = 3;
      return data;
    });
  }
}

final count3Provider = AsyncNotifierProvider<Count3Notifier, int>(Count3Notifier.new);

