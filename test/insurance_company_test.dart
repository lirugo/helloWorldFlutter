import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main(){
  final url = 'http://localhost:9094/api/v1/insurance-company';

  test('Get insurance company list from a network', () async {
    final response = await http.get(url);
    // Response code equal 200
    expect(response.statusCode, 200);

    if (response.statusCode == 200) {
      final insuranceCompanyList = json.decode(response.body) as List;

      // Insurance company list not empty
      expect(insuranceCompanyList.isNotEmpty, true);

    }else{
      //throw error
    }
  });
}