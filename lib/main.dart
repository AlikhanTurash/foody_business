import 'package:flutter/material.dart';
import 'package:foody_business/page/login_page.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

AppMetricaConfig get _config =>
    const AppMetricaConfig('3484ef59-b6b4-4041-acf0-d89b4bce0da2', logs: true);

Future<void> main() async {
  AppMetrica.runZoneGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    AppMetrica.activate(_config);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
// TODO:Create Splash screen

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(secondary: Colors.black12, primary: Colors.black54),
      ),
      home: LoginPage(),
    );
  }
}
