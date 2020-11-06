import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_flutter/src/utils/styles.dart';
import 'package:hello_world_flutter/src/view/my_widget.dart';

class InsuranceCaseView extends StatefulWidget {
  const InsuranceCaseView({Key key, @required this.id}) : super(key: key);
  final String id;

  @override
  _InsuranceCaseViewState createState() => _InsuranceCaseViewState();
}

class _InsuranceCaseViewState extends State<InsuranceCaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fintech'),
        ),

        backgroundColor: Colors.red,
        body: Text(widget.id)
    );
  }
}
