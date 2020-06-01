import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Natve App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _bateryLevel;

  Future<void> _getBatteryLevel() async {
    const platform = MethodChannel('course.flutter.dev/battery');
    try {
      final bateryLevel = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _bateryLevel = bateryLevel;
      });
    } on PlatformException catch (error) {
      setState(() {
        _bateryLevel = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Code'),
      ),
      body: Center(
        child: Text('Battery level: $_bateryLevel'),
      ),
    );
  }
}
