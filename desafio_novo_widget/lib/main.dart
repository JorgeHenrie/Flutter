import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicação'),
        ),
        body: ListView(
          children: [
            Quadrado(),
            Quadrado(),
            Quadrado(),
            Quadrado(),
            Quadrado(),
            Quadrado(),
          ],
        ),
      ),
    );
  }
}

class Quadrado extends StatelessWidget {
  const Quadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.black26,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.pink,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
