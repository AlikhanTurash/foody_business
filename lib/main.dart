import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody_business/page/home_page.dart';
import 'package:foody_business/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});
// TODO:Create Splash screen

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.black12, primary: Colors.black54),
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something went wrong!'));
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPage();
              }
            }));
  }
}
