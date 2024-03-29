import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/other_notifier_provider_page.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('NotifierProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(count4Provider).toString()),
            TextButton(
              onPressed: () {
                ref.read(count4Provider.notifier).increment();
              },
              child: const Text('increment'),
            ),
            TextButton(
              onPressed: () {
                ref.read(count4Provider.notifier).reset();
              },
              child: const Text('reset'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherNotifierProviderPage(),
                  ),
                );
              },
              child: const Text('OtherNotifierProviderPage'),
            ),
          ],
        ),
      ),
    );
  }
}
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}

final count4Provider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});
