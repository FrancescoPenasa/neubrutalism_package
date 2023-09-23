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
      title: 'NeuBrtutalism Theme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String result = "No btn press";
    return Scaffold(
      appBar: AppBar(
        title: const Text("NeuBrutalism Theme"),
      ),
      body: Column(children: [
        NeuButton(
          btnType: NeuBtnType.round,
          onPressed: () {
            result = "Yes btn press";
          },
          child: const Text('Test Button'),
        ),
        Text(result)
      ]),
    );
  }
}
