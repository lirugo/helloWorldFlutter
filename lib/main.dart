import 'package:flutter/material.dart';

import 'src/vehicle.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _vehicles.removeAt(0);
          });
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          children: _vehicles.map(_buildVehicle).toList(),
        ),
      ),
    );
  }

  Widget _buildVehicle(Vehicle v) {
    return Padding(
      key: Key(v.model + v.make + v.year),
      padding: const EdgeInsets.all(0),
      child: ExpansionTile(
        title: Text(v.make + " " + v.model, style: TextStyle(fontSize: 16)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(v.year + " year"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.launch),
                )
              ],
            ),
          ),
        ],
        // onTap: () {
        //
        // },
      ),
    );
  }
}
