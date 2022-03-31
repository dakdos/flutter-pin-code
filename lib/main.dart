import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_build/emoji.dart';
import 'package:test_build/pin.dart';
import 'package:test_build/sound.dart';
import 'package:test_build/tiket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Tiket());
              },
              child: const Text('Ticket'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Pin());
              },
              child: const Text('Pin'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Emoji());
              },
              child: const Text('Emot'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Sound() );
              }, 
              child: const Text('Sound'),
            ),
          ],
        ),
      ),
    );
  }
}
