import 'package:flutter/material.dart';
import 'package:pincay_nick_leccion/widgets/pincay_nick_login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pincay Nick Lección',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const PincayNickLogin(),
    );
  }
}
