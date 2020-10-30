import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/src/model/insurance_company.dart';
import 'package:hello_world_flutter/src/serializers.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Fintech'),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0',
      style: optionStyle,
    ),
    Text(
      'Index 1',
      style: optionStyle,
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future _insuranceCompanyList;

  Future<BuiltList<InsuranceCompany>> _getInsuranceCompanyList() async {
    BuiltList<InsuranceCompany> insuranceCompanyList;

    final url = 'http://192.168.11.78:9094/api/v1/insurance-company';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonList = json.decode(utf8.decode(response.bodyBytes)) as List;
      insuranceCompanyList = deserializeListOf<InsuranceCompany>(jsonList);
    }

    return insuranceCompanyList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getInsuranceCompanyList(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none &&
              snap.hasData == null) {
            return Container();
          } else {
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                InsuranceCompany ic = snap.data[index];
                return Column(
                  children: <Widget>[_buildVehicle(ic)],
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Старховые',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.time_to_leave),
            label: 'ДТП',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildVehicle(InsuranceCompany ic) {
    return Padding(
      key: Key(ic.id),
      padding: const EdgeInsets.all(0),
      child: ExpansionTile(
        title: Text(ic.name, style: TextStyle(fontSize: 16)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ic.phoneNumber + "\n" + ic.address),
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
