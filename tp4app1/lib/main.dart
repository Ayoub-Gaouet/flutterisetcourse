import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart'; // Import this for BuildContext

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String documentsPath = '';
  String tempPath = '';

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      documentsPath = join(docDir.path, 'pizzalist.json');
      tempPath = join(tempDir.path, 'pizzalist.json');
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context as BuildContext).loadString('assets/pizzalist.json');
    List myMap = jsonDecode(myString);

    List<Pizza> myPizzas = [];

    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    });

    return myPizzas;
  }

  @override
  void initState() {
    getPaths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Path Provider')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Doc path: ' + documentsPath,
                  style: TextStyle(fontSize: 20.0)),
              Text('Temp path: ' + tempPath, style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class Pizza {
  int id = 0;
  String pizzaName = '';
  String description = '';
  double price = 0;
  String imageUrl = '';

  Pizza.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.pizzaName = json['pizzaName'];
    this.description = json['description'];
    this.price = json['price'].toDouble();
    this.imageUrl = json['imageUrl'];
  }
}
