import 'dart:convert';
import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world_flutter/src/model/insurance_case.dart';
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

      default:
        widget = InsuranceCompanies();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fintech'),
      ),
      body: Center(
        child: widget,
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
          ],
        ),
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
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class InsuranceCompanies extends StatefulWidget {
  InsuranceCompanies({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InsuranceCompaniesState createState() => _InsuranceCompaniesState();
}

class _InsuranceCompaniesState extends State<InsuranceCompanies> {
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
      body: FutureBuilder(
        future: _getInsuranceCompanyList(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none &&
              snap.hasData == null) {
            return Container();
          } else {
            return ListView.builder(
              itemCount: snap.data != null ? snap.data.length : 0,
              itemBuilder: (context, index) {
                InsuranceCompany ic = snap.data[index];
                return Column(
                  children: <Widget>[_buildInsuranceCompanies(ic)],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildInsuranceCompanies(InsuranceCompany ic) {
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
      ),
    );
  }
}

class InsuranceCases extends StatefulWidget {
  InsuranceCases({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InsuranceCasesState createState() => _InsuranceCasesState();
}

class _InsuranceCasesState extends State<InsuranceCases> {
  Future<BuiltList<InsuranceCase>> _getInsuranceCaseList() async {
    BuiltList<InsuranceCase> insuranceCaseList;

    final url = 'http://192.168.11.78:9094/api/v1/insurance-case';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonList = json.decode(utf8.decode(response.bodyBytes)) as List;
      insuranceCaseList = deserializeListOf<InsuranceCase>(jsonList);
    }

    return insuranceCaseList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getInsuranceCaseList(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none &&
              snap.hasData == null) {
            return Container();
          } else {
            return ListView.builder(
              itemCount: snap.data != null ? snap.data.length : 0,
              itemBuilder: (context, index) {
                InsuranceCase ic = snap.data[index];
                return Column(
                  children: <Widget>[_buildInsuranceCases(ic)],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildInsuranceCases(InsuranceCase ic) {
    return Padding(
      key: Key(ic.insuranceCase.title + ic.insuranceCase.address),
      padding: const EdgeInsets.all(0),
      child: ExpansionTile(
        title: Text(ic.insuranceCase.title, style: TextStyle(fontSize: 16)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Адрес: ${ic.insuranceCase.address} \n'
                    'Клиент: ${ic.insuredClient.phoneNumber} \n'
                    '${ic.insuredClient.lastName} ${ic.insuredClient.firstName} ${ic.insuredClient.middleName}\n\n'
                    'Транспортное средство:\n'
                    'Модель: ${ic.insuredVehicle.model}\n'
                    'Марка: ${ic.insuredVehicle.make}\n'
                    'VIN: ${ic.insuredVehicle.vin}\n'
                    'Год: ${ic.insuredVehicle.year}\n'
                    'Гос. номер: ${ic.insuredVehicle.licensePlate}\n'
                    'Цвет: ${ic.insuredVehicle.color}\n'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.launch),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        "Иванов Иван",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Icon(
                        Icons.verified_user,
                        color: Colors.white,
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: Colors.red,
                          ),
                          title: Text("Изменить пароль"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Colors.red,
                          ),
                          title: Text("Изменить язык"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change language
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          title: Text("Изменить профиль"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: SwitchListTile(
                              activeColor: Colors.red,
                              contentPadding: const EdgeInsets.all(0),
                              value: true,
                              title: Text("Уведомления по email"),
                              onChanged: (val) {},
                            ),
                          ),
                          _buildDivider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: SwitchListTile(
                              activeColor: Colors.red,
                              contentPadding: const EdgeInsets.all(0),
                              value: true,
                              title: Text("Уведомления по sms"),
                              onChanged: (val) {},
                            ),
                          ),
                          _buildDivider(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: SwitchListTile(
                              activeColor: Colors.red,
                              contentPadding: const EdgeInsets.all(0),
                              value: true,
                              title: Text("Уведомления в приложении"),
                              onChanged: (val) {},
                            ),
                          ),
                          _buildDivider(),

                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
