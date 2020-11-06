import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world_flutter/src/view/camera.dart';
import 'package:hello_world_flutter/src/view/insurance_cases.dart';
import 'package:hello_world_flutter/src/view/insurance_companies.dart';
import 'package:hello_world_flutter/src/view/settings.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = InsuranceCompanies();
    switch (_selectedIndex) {
      case 0:
        widget = InsuranceCompanies();
        break;

      case 1:
        widget = InsuranceCases();
        break;

      case 2:
        widget = Settings();
        break;

      case 3:
        widget = Camera(cameras: cameras);
        break;

      default:
        widget = InsuranceCompanies();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fintech'),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.grey.shade300),
        child: Center(
          child: widget,
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 18),
                child: Row(
                  children: [
                    new Padding(padding: new EdgeInsets.only(left: 10.0, right: 20.0),
                        child: new CircleAvatar(radius: 35.0, backgroundImage: NetworkImage('https://img1.grunge.com/img/uploads/2018/11/scientific-effects-happen-man-grows-beard.jpg'),)
                    ),
                    Text('Иванов Иван', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Напоминания'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Отчеты'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Пользователи'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Камера'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Camera(cameras: cameras)),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        backgroundColor: Colors.white,
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
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}