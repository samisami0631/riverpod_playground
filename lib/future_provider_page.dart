import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/future_provider.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          // 状態を更新する
          ref.refresh(delayFetchProvider);
        },
      ),
      body: Center(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
