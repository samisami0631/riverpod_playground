import 'package:flutter_riverpod/flutter_riverpod.dart';

final delayFetchProvider = FutureProvider<String>(
  (ref) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'あけましておめでとう';
  },
);
