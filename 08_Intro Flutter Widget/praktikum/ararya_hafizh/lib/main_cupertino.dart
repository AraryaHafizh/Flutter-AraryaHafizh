import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertinp Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
      ),
      home: TampilNama(),
    );
  }
}

class TampilNama extends StatelessWidget {
  const TampilNama({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Ararya App'),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Cupertino',
            style: TextStyle(fontSize: 24),
          )
        ]),
      ),
    );
  }
}
