import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/future_provider_page.dart';

class OtherFutureProviderPage extends ConsumerWidget {
  const OtherFutureProviderPage({super.key});

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
            // Text(asyncValue.toString()),
            asyncValue.when(
              error: (err, _) => Text(err.toString()), //エラー時
              loading: () => const CircularProgressIndicator(), //読み込み時
              data: (data) => Text(data.toString()), //データ受け取り時
            ),
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
