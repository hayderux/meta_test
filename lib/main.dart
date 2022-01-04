import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

Future<void> main() async {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}
