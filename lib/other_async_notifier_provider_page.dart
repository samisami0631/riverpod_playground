import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/async_notifier_provider_page.dart';

class OtherAsyncNotifierProviderPage extends ConsumerWidget {
  const OtherAsyncNotifierProviderPage({super.key});

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
          ],
        ),
      ),
    );
  }
}
