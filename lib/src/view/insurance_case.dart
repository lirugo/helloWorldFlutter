import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_flutter/src/utils/styles.dart';
import 'package:hello_world_flutter/src/view/my_widget.dart';

class InsuranceCase extends StatefulWidget {
  const InsuranceCase({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _InsuranceCaseState createState() => _InsuranceCaseState();
}

class _InsuranceCaseState extends State<InsuranceCase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Insurance case')
    );
  }
}
