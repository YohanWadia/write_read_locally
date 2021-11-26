import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage('Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _contentOfFile = "";

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/file2.txt';
    print(filePath.toString());
    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath());
    //file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt");
    file.writeAsString("4th part as update", mode:FileMode.append);//This also created the file on the 1st run
  }

  void readFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();

    print('File Content: $fileContent');
  }

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
            Text(
              _contentOfFile,
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () => {saveFile()},
              child: Text("Save File"),
            ),
            RaisedButton(
              onPressed: () => {readFile()},
              child: Text("Read File"),
            ),
          ],
        ),
      ),
    );
  }
}