import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_world_flutter/src/model/insurance_case_info.dart';
import 'package:hello_world_flutter/src/model/insured_vehicle.dart';

import 'insured_client.dart';

part 'insurance_case.g.dart';

abstract class InsuranceCase implements Built<InsuranceCase, InsuranceCaseBuilder>{

  static Serializer<InsuranceCase> get serializer => _$insuranceCaseSerializer;

  @nullable
  InsuranceCaseInfo get insuranceCase;

  @nullable
  InsuredClient get insuredClient;

  @nullable
  InsuredVehicle get insuredVehicle;

  InsuranceCase._();

  factory InsuranceCase([void Function(InsuranceCaseBuilder) updates]) = _$InsuranceCase;
}