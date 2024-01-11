import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/other_state_provider_page.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('StateProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(count2Provider).toString()),
            TextButton(
              onPressed: () {
                ref.read(count2Provider.notifier).state++;
              },
              child: const Text('increment'),
            ),
            TextButton(
              onPressed: () {
                ref.read(count2Provider.notifier).state = 0;
              },
              child: const Text('reset'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherStateProviderPage(),
                  ),
                );
              },
              child: const Text('OtherStateProviderPage'),
            ),
          ],
        ),
      ),
    );
  }
}

final count2Provider = StateProvider(
  (ref){
    return 0;
  }
);
