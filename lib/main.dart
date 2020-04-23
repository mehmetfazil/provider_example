import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AirportDisplay(),
            AirportSelector(),
          ],
        ),
      ),
    );
  }
}

class AirportDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Selected Airport is LGKO');
  }
}

class AirportSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlatButton(
          child: Text('LGKO'),
          color: Colors.blue,
          onPressed: () {},
        ),
        FlatButton(
          child: Text('LTFM'),
          color: Colors.blue,
          onPressed: () {},
        ),
      ],
    );
  }
}
