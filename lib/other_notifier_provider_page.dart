import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/notifier_provider_page.dart';

class OtherNotifierProviderPage extends ConsumerWidget {
  const OtherNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('OtherNotifierProviderPage'),
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
          ],
        ),
      ),
    );
  }
}
