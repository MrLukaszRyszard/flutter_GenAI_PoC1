//import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoC1 App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textFieldController;
  String enteredText = '';

  @override
  void initState() {
    super.initState();
    textFieldController = TextEditingController();
  }

   //void dispose() {
    //textFieldController.dispose();
   // super.dispose();
  //}

  void submitText() {
    setState(() {
      enteredText = textFieldController.text;
    });
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prove of Concept 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your question:'),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'Type your question here...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => submitText(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: submitText,
              child: Text('Submit'),
            ),
            SizedBox(height: 10),
            Text(
              'The answer to your question: \n$enteredText',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
