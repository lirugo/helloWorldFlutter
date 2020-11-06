import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world_flutter/src/component/my_drawer.dart';
import 'package:hello_world_flutter/src/view/camera.dart';
import 'package:hello_world_flutter/src/view/insurance_cases.dart';
import 'package:hello_world_flutter/src/view/insurance_companies.dart';
import 'package:hello_world_flutter/src/view/settings.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key key, this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
        drawer: MyDrawer(cameras: widget.cameras),
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
