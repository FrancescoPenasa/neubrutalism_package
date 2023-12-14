import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neubrutalism_theme/neubrutalism_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: kDebugMode ? MyHomePage(title: 'debug') : MyHomePage(title: 'prod'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          NeuButton(
            btnType: NeuBtnType.square,
            onPressed: () {
              print("test");
            },
            child: const Text('Test Button'),
          )
        ],
      ),
    );
  }
}
