import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/src/model/insurance_case.dart';
import 'package:http/http.dart' as http;

import '../serializers.dart';

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
      backgroundColor: Colors.transparent,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildInsuranceCases(InsuranceCase ic) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        key: Key(ic.insuranceCase.title + ic.insuranceCase.address),
        padding: const EdgeInsets.all(0),
        child: ExpansionTile(
          title: Text(ic.insuranceCase.title, style: TextStyle(fontSize: 16)),
          children: [
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RaisedButton(
                    elevation: 1,
                    onPressed: () => {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: EdgeInsets.all(1.0),
                    color: Colors.green,
                    child: Text('Открыть', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
