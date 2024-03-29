import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/other_state_notifier_provider_page.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('StateNotifierProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(countProvider).toString()),
            TextButton(
              onPressed: () {
                ref.read(countProvider.notifier).increment();
              },
              child: const Text('increment'),
            ),
            TextButton(
              onPressed: () {
                ref.read(countProvider.notifier).reset();
              },
              child: const Text('reset'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherStateNotifierProviderPage(),
                  ),
                );
              },
              child: const Text('OtherStateNotifierProviderPage'),
            ),
          ],
        ),
      ),
    );
  }
}

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
