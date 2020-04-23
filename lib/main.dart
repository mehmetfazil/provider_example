import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// 1st step
// create a model that we can pass from
// widget to widget using provider package
class AirportModel extends ChangeNotifier {
  String _airport = 'LGKO';
  String get airport => _airport;

  set airport(String newAirport) {
    _airport = newAirport;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 2nd step
      // use that ChangeNotifier to access it
      // initiate the airportModel there
      // now all descendant widgets can access it
      // and whenever there is a change hopefully
      // the provider will notify the listeners
      // and they will adapt their behaviour
      home: ChangeNotifierProvider(
        create: (context) => AirportModel(),
        child: MyHomePage()),
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
    // Step 3
    // obtain Airport information
    final airport = Provider.of<AirportModel>(context).airport;
    return Text('Selected Airport is $airport');
  }
}

class AirportSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 4
    // change the value of airports
    final model = Provider.of<AirportModel>(context);
    return ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlatButton(
          child: Text('LGKO'),
          color: Colors.blue,
          // step 4 continues here
          onPressed: () {model.airport = 'LGKO';},
        ),
        FlatButton(
          child: Text('LTFM'),
          color: Colors.blue,
          onPressed: () {model.airport = 'LTFM';},
        ),
      ],
    );
  }
}