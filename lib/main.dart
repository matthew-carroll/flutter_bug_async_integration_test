import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bug',
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
  bool _runningPing = false;

  Future<void> _pingNetwork() async {
    print('Pinging network');
    setState(() {
      _runningPing = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    final response = await http.get(
      Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'),
    );
    print('Response: ${response.statusCode}:');
    print(response.body);

    if (mounted) {
      setState(() {
        _runningPing = false;
      });
    }
    print('Done with network ping');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test App'),
        ),
        body: Stack(
          children: [
            Center(
              child: ElevatedButton(
                key: ValueKey('button_ping'),
                onPressed: _pingNetwork,
                child: Text('Ping network'),
              ),
            ),
            if (_runningPing)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
