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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Fintech'),
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
  Future _insuranceCompanyList;

  _HomePageState() {}

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
                    children: <Widget>[
                      _buildVehicle(ic)
                    ],
                  );
                },
              );
            }
          },
        ));
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
