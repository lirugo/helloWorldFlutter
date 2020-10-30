import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'insured_client.dart';

part 'insurance_case_info.g.dart';

abstract class InsuranceCaseInfo implements Built<InsuranceCaseInfo, InsuranceCaseInfoBuilder>{

  static Serializer<InsuranceCaseInfo> get serializer => _$insuranceCaseInfoSerializer;

  @nullable
  String get status;

  @nullable
  String get expertRequest;

  @nullable
  String get title;

  @nullable
  String get address;

  InsuranceCaseInfo._();

  factory InsuranceCaseInfo([void Function(InsuranceCaseInfoBuilder) updates]) = _$InsuranceCaseInfo;
}