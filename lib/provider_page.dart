import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(addTextProvider)),
          ],
        ),
      ),
    );
  }
}

final addTextProvider = Provider(
  (ref) {
    return 'あけましておめでとう';
  },
);
