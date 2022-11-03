import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extraction App',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController sentenceTEC = TextEditingController();
  TextEditingController extracted_NumbersTEC = TextEditingController();
  TextEditingController extracted_LettersTEC = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Extraction App")),
      body: Column(
        children: [
          TextField(
              controller: sentenceTEC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blueAccent,
                  hintText: "Enter the sentence")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  String extractedNumbers =
                      sentenceTEC.text.replaceAll(new RegExp(r'[^0-9]'), '');
                  String extractedLetters =
                      sentenceTEC.text.replaceAll(new RegExp('[^A-Za-z]'), '');
                  extracted_NumbersTEC.text = extractedNumbers;
                  extracted_LettersTEC.text = extractedLetters;
                });
              },
              child: Text("TAMAM")),
          TextField(
              enabled: false,
              controller: extracted_LettersTEC,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueAccent,
              )),
          TextField(
              enabled: false,
              controller: extracted_NumbersTEC,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueAccent,
              )),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  extracted_LettersTEC.text =
                      extracted_NumbersTEC.text = sentenceTEC.text = "";
                });
              },
              child: Text("CLEAR")),
        ],
      ),
    );
  }
}
