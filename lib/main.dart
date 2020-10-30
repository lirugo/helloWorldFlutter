import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
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
                Text(
                    'Адрес: ${ic.insuranceCase.address} \n'
                    'Клиент: ${ic.insuredClient.phoneNumber} \n'
                    '${ic.insuredClient.lastName} ${ic.insuredClient.firstName} ${ic.insuredClient.middleName}\n\n'
                    'Транспортное средство:\n'
                    'Модель: ${ic.insuredVehicle.model}\n'
                    'Марка: ${ic.insuredVehicle.make}\n'
                    'VIN: ${ic.insuredVehicle.vin}\n'
                    'Год: ${ic.insuredVehicle.year}\n'
                    'Гос. номер: ${ic.insuredVehicle.licensePlate}\n'
                    'Цвет: ${ic.insuredVehicle.color}\n'
                ),
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

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Settings'),
        onPressed: () {
          // Navigate to second route when tapped.
        },
      ),
    );
  }
}
