import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/app/app.dart';

void main() {
  runApp(const MyWalletApp());
}

class MyWalletApp extends StatelessWidget {
  const MyWalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      title: 'My Wallet App',
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
