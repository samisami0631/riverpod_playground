import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/async_notifier_provider_page.dart';
import 'package:riverpod_playground/future_provider_page.dart';
import 'package:riverpod_playground/notifier_provider_page.dart';
import 'package:riverpod_playground/provider_page.dart';
import 'package:riverpod_playground/state_notifier_provider_page.dart';
import 'package:riverpod_playground/state_provider_page.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Provider'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Page(
              path: ProviderPage(),
              name: '①Provider',
            ),
            Page(
              path: StateProviderPage(),
              name: '②StateProvider',
            ),
            Page(
              path: StateNotifierProviderPage(),
              name: '③StateNotifierProvider',
            ),
            Page(
              path: NotifierProviderPage(),
              name: '⑤NotifierProvider',
            ),
            Page(
              path: FutureProviderPage(),
              name: '⑥FutureProvider',
            ),
            Page(
              path: AsyncNotifierProviderPage(),
              name: '⑦AsyncNotifierProvider',
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required this.path, required this.name});
  final Widget path;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => path,
          ),
        );
      },
      child: Text(name),
    );
  }
}
