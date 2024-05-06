import 'dart:js';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _layout = MainAxisAlignment.center;

  //Agrego metodos para mas botones con eventos nuevos y los llamo 
  //en mi Widget build -> floatingActionButton: SpeedDial()
  void _increment2KCounter() {
    setState(() {
      int _plus2K = 2000;

      _counter+=_plus2K; //Cambio el incremento del counter por 2000, refactorizando el icono
    });
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

    void _decreaseCounter() {
    setState(() {

      _counter--;
    });
  }

  void _nextLayout() {
    setState(() {
      _layout =_nextEnumLayout(_layout);
    });
  }

  MainAxisAlignment _nextEnumLayout(MainAxisAlignment value) {
    final nextIndex = (value.index + 1) % MainAxisAlignment.values.length;
    return MainAxisAlignment.values[nextIndex];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
   
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: _layout,
          children: <Widget>[
            const Text(
              'Contador de numero',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.auto_awesome_motion_sharp, //CAMBIO TIPO ICONS
        backgroundColor: Color.fromARGB(255, 243, 33, 68),
        children: [
          SpeedDialChild(
          child: const Icon(Icons.plus_one_outlined, color: Colors.white), //CAMBIO TIPO ICONS Y COLOR
          label: 'Sumar uno',
          backgroundColor:Color.fromARGB(255, 243, 33, 68),
          onTap: _incrementCounter, //Llamo a metodo correspondiete con su accionar
          ),
            SpeedDialChild(
            child: const Icon(Icons.remove, color: Colors.white), //CAMBIO TIPO ICONS
            label: 'Restar uno',
            backgroundColor:Color.fromARGB(255, 243, 33, 68),
            onTap: _decreaseCounter, //Llamo a metodo correspondiete con su accionar
            ),
              SpeedDialChild(
              child: const Icon(Icons.two_k_plus_outlined, color: Colors.white), //CAMBIO TIPO ICONS
              label: 'Sumar de a 2000',
              backgroundColor:Color.fromARGB(255, 243, 33, 68),
              onTap: _increment2KCounter, //Llamo a metodo correspondiete con su accionar
              ),
                SpeedDialChild(
                child: const Icon(Icons.layers_outlined,color: Colors.white),
                label: 'Layout',
                backgroundColor: Color.fromARGB(255, 243, 33, 68),
                onTap: _nextLayout, //Llamo a metodo correspondiete con su accionar
                ),
      ]),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _nextLayout,//_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
