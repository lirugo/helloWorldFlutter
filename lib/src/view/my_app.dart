import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world_flutter/src/view/camera.dart';
import 'package:hello_world_flutter/src/view/insurance_cases.dart';
import 'package:hello_world_flutter/src/view/insurance_companies.dart';
import 'package:hello_world_flutter/src/view/settings.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key, this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomTabWidget = InsuranceCompanies();
    switch (_selectedIndex) {
      case 0:
        bottomTabWidget = InsuranceCompanies();
        break;

      case 1:
        bottomTabWidget = InsuranceCases();
        break;

      case 2:
        bottomTabWidget = Settings();
        break;

      case 3:
        bottomTabWidget = Camera(cameras: widget.cameras);
        break;

      default:
        bottomTabWidget = InsuranceCompanies();
        break;
    }

    return MaterialApp(
      title: 'Fintech',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fintech'),
        ),
        body: Container(
          decoration: new BoxDecoration(color: Colors.grey.shade300),
          child: Center(
            child: bottomTabWidget,
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
                      new Padding(
                          padding: new EdgeInsets.only(left: 10.0, right: 20.0),
                          child: new CircleAvatar(
                            radius: 35.0,
                            backgroundImage: NetworkImage(
                                'https://img1.grunge.com/img/uploads/2018/11/scientific-effects-happen-man-grows-beard.jpg'),
                          )),
                      Text('Иванов Иван',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Напоминания'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('Отчеты'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Пользователи'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Камера'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Camera(cameras: widget.cameras)),
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
      ),
    );
  }
}
