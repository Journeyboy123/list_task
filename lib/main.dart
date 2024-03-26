import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintPointersEnabled = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'This is title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;z
  //   });
  // }

  var countController = TextEditingController();
  var countFocus = FocusNode();
  var color = -1;
  var inverseColor = false;
  int count = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      color = 0;
                      setState(() {});
                    },
                    child: Text(
                      "Red",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 7, 247, 39)),
                    ),
                    onPressed: () {
                      color = 2;
                      setState(() {});
                    },
                    child: Text(
                      "Green",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 7, 178, 230)),
                  ),
                  onPressed: () {
                    color = 1;
                    setState(() {});
                  },
                  child: Text(
                    "Blue",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: countController,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.numbers,
                      size: 36,
                      color: Colors.black,
                    ),
                    labelText: "Count",
                    labelStyle: TextStyle(color: Colors.black),
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 2.5))),
                maxLength: 2,
                focusNode: countFocus,
              ),
            )),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    fixedSize: const MaterialStatePropertyAll(Size(90, 30)),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 59, 209, 255))),
                onPressed: () {
                  setState(() {
                    count = int.tryParse(countController.text) ?? 0;
                    print(count);
                  });
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ))
          ]),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: count,
                itemBuilder: (((context, index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.all(2),
                    // height: 50,
                    color: inverseColor == true
                        ? index % 2 == 0
                            ? Colors.blueGrey
                            : color == -1
                                ? Colors.white
                                : color == 0
                                    ? Colors.red
                                    : color == 1
                                        ? Colors.blue
                                        : Colors.green
                        : color == -1
                            ? Colors.white
                            : color == 0
                                ? Colors.red
                                : color == 1
                                    ? Colors.blue
                                    : Colors.green,

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 36,
                        ),
                      ],
                    ),
                  );
                }))),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
