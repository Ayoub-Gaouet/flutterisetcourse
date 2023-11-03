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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  int _counter = 0;
  String message = "Hello";
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
      message = "Hello ${_counter}";
    });
  }

  void _decrimentaionCounter() {
    setState(() {
      _counter--;
      message = "Hello ${_counter}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:Container(
        margin: EdgeInsets.only(left: 20.0), // Add a margin of 20 to the left
          child: Row(
              children:[
                FloatingActionButton(
                  onPressed: _decrimentaionCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.remove ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ]
      ),
    ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
