import 'package:flutter/material.dart';
import 'vehicle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Vehicle> _vehicles = vehicles;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        children: _vehicles.map(_buildVehicle).toList(),
      ),
    );
  }

  Widget _buildVehicle(Vehicle v) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListTile(
          title: Text(v.make + " " + v.model, style: TextStyle(fontSize: 24)),
        subtitle: new Text(v.year + " year"),
        onTap: () {

        },
      ),
    );
  }
}
