import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'insured_client.dart';

part 'insurance_case.g.dart';

abstract class InsuranceCase implements Built<InsuranceCase, InsuranceCaseBuilder>{

  static Serializer<InsuranceCase> get serializer => _$insuranceCaseSerializer;

  @nullable
  String get id;

  @nullable
  InsuredClient get insuredClient;

  InsuranceCase._();

  factory InsuranceCase([void Function(InsuranceCaseBuilder) updates]) = _$InsuranceCase;
}