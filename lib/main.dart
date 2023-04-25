import 'package:flutter/material.dart';
import 'package:emia_flutter_app/page/hamster.dart'
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMIA DEMO',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'EMIA DEMO'),
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

enum Pet { cat, pig, hamster }
enum Interface {home, notice, settings, pet}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  Pet _pet = Pet.cat; // 0: cat, 1: pig, 2: hamster
  List<Widget> _pages = [
    MyHomePage(),
    Hamster(),
  ];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--; // testing
    });
  }
  void _setPet(Pet pet){
    setState(() {
      _pet = pet;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
            ),
            body: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: _pages[_currentIndex]),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton.extended(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      label: Text('Increment'),
                      icon: const Icon(Icons.add),
                    )), // This trailing comma makes auto-formatting nicer for build methods.,
                Container(
                    margin: EdgeInsets.only(top: 100.0),
                    child: FloatingActionButton.extended(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      label: Text('Decrement'),
                      icon: const Icon(Icons.remove),
                    )),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notification_important), label: 'Notice'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 125, 120, 231),
                        image:
                            DecorationImage(image: AssetImage('img/user.png')),
                        shape: BoxShape.circle),
                    child: Text('EMIA'),
                  ),
                  ListTile(
                    title: const Text('Cat'),
                    onTap: () {
                      _decrementCounter(); // TODO
                    },
                  ),
                  ListTile(
                    title: const Text('Pig'),
                    onTap: () {
                      _incrementCounter(); // TODO
                    },
                  ),
                  ListTile(
                    title: const Text('Hamster'),
                    onTap: () {
                      _incrementCounter(); // TODO
                    },
                  ),
                ],
              ),
            )));
  }
}
