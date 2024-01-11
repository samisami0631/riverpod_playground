import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(delayFetchProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('FutureProviderPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(asyncValue.toString()),
            switch (asyncValue) {
              AsyncError(:final error) => Text('Error: $error'),
              AsyncData(:final value) => Text(value.toString()),
              _ => const CircularProgressIndicator(),
            },
            // asyncValue.when(
            //   error: (err, _) => Text(err.toString()), //エラー時
            //   loading: () => const CircularProgressIndicator(), //読み込み時
            //   data: (data) => Text(data.toString()), //データ受け取り時
            // ),
            TextButton(
              onPressed: () {
                ref.refresh(delayFetchProvider);
              },
              child: const Text('reload'),
            ),
          ],
        ),
      ),
    );
  }
}

final delayFetchProvider = FutureProvider<String>(
  (ref) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'あけましておめでとう';
  },
);
