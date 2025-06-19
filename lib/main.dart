import 'package:challenge/src/data/repository/local/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge/src/features/multicounter/multicounter_page/multicounter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initPreferences();

  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiCounterPage(),
      ),
    ),
  );
}
