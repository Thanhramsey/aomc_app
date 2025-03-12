import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'dart:io';
import 'providers/sync_provider.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SyncProvider()),
    ],
    child: MyApp(),
  ),
  );
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
