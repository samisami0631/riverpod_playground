import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/async_notifier_provider.dart';
import 'package:riverpod_playground/future_provider.dart';
import 'package:riverpod_playground/future_provider_page.dart';
import 'package:riverpod_playground/notifier_provider.dart';
import 'package:riverpod_playground/provider.dart';
import 'package:riverpod_playground/state_notifier_provider.dart';
import 'package:riverpod_playground/state_notifier_provider_page.dart';
import 'package:riverpod_playground/state_provider.dart';
import 'package:riverpod_playground/state_provider_page.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueText = ref.watch(delayFetchProvider);
    final asyncValueInt = ref.watch(count3Provider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Provider'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Title(title: '①Provider'),
              Text(ref.watch(addTextProvider)),
              const Title(title: '②StateNotifierProvider'),
              Text(ref.watch(countProvider).toString()),
              TextButton(
                onPressed: () {
                  ref.read(countProvider.notifier).increment();
                },
                child: const Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StateNotifierProviderPage(),
                    ),
                  );
                },
                child: const Text('StateNotifierProviderのリセットページへ'),
              ),
              const Title(title: '③StateProvider'),
              Text(ref.watch(count2Provider).toString()),
              TextButton(
                onPressed: () {
                  ref.read(count2Provider.notifier).state++;
                },
                child: const Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StateProviderPage(),
                    ),
                  );
                },
                child: const Text('StateProviderのリセットページへ'),
              ),
              const Title(title: '④FutureProvider'),
              Text(asyncValueText.toString()),
              asyncValueText.when(
                error: (err, _) => Text(err.toString()),
                loading: () => const CircularProgressIndicator(),
                data: (data) => Text(data.toString()),
              ),
              TextButton(
                onPressed: () {
                  ref.refresh(delayFetchProvider);
                },
                child: const Text('reload'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FutureProviderPage(),
                    ),
                  );
                },
                child: const Text('FutureProviderの実験ページへ'),
              ),
              const Title(title: '⑤AsyncNotifierProvider'),
              Text(asyncValueInt.toString()),
              asyncValueInt.when(
                error: (err, _) => Text(err.toString()),
                loading: () => const CircularProgressIndicator(),
                data: (data) => Text(data.toString()),
              ),
              TextButton(
                onPressed: () {
                  ref.read(count3Provider.notifier).increment(context);
                },
                child: const Text('increment'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(count3Provider.notifier).log(context);
                },
                child: const Text('log'),
              ),
              const Title(title: '⑥NotifierProvider'),
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
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
