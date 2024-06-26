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
      title: 'PowerPoint風UIその２',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PowerPoint風UIその２'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double d3 = 0.0;
  Offset _posision = Offset(0, 0);
  String _gestureText = 'Try GestureDetector!';
  String _detailsText = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      _counter++;
    });
  }
  void _onPanUpdate(DragUpdateDetails details,bool isHorizontal){
    setState(() {
      _posision = Offset(
          _posision.dx + (isHorizontal ? details.primaryDelta! : 0),
          _posision.dy + (!isHorizontal ? details.primaryDelta! : 0));
    });

    print('globalPosition: ${details.globalPosition}');
    print('localPosition: ${details.localPosition}');
    print('delta: ${details.delta}');
    print('primaryDelta: ${details.primaryDelta}');
    print('sourceTimeStamp: ${details.sourceTimeStamp}');
  }
  void _updateGestureText(String text) {
    setState(() {
      _gestureText = text;
    });
  }

  void _updateDetailsText(String text) {
    setState(() {
      _detailsText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        title: Text(widget.title),
      ),
      body: /*Center(
        // Center is a layout widget. It takes a single child and positions it
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: (){
                print('onTap()');
                d3 = 0;
              },
              onTapDown: (details1){
                print('onTapDown():$details1');
              },
              onTapUp: (details2){
                print('onTapUp():$details2');
              },
              onVerticalDragUpdate: (details3){
                print('onVerticalDragUpdate():$details3 d3:$d3');
                d3 = d3 + details3.delta.dy ;
                setState(() {

                });
              },
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: const Text(
                  'How to use GestureDetector',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),*/
      /*Stack(
        children: [
          Positioned(
            left: _posision.dx,
            top: _posision.dy,
            child: GestureDetector(
              onHorizontalDragUpdate: (details){_onPanUpdate(details, true);},
              onVerticalDragUpdate: (details){_onPanUpdate(details, false );},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),*/
      Stack(
        children: [
          GestureDetector(
            onTap: () => _updateGestureText('Tap detected!'),
            onDoubleTap: () => _updateGestureText('Double tap detected!'),
            onLongPress: () => _updateGestureText('Long press detected!'),
            onVerticalDragEnd: (details) {
              _updateGestureText('Vertical swipe detected!');
              _updateDetailsText(
                  'Velocity: ${details.primaryVelocity} ${details.velocity}');
            },
            onHorizontalDragEnd: (details) {
              _updateGestureText('Horizontal swipe detected!');
              _updateDetailsText(
                  'Velocity: ${details.primaryVelocity}  ${details.velocity}');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _gestureText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _detailsText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
