import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'insurance_company.g.dart';

abstract class InsuranceCompany implements Built<InsuranceCompany, InsuranceCompanyBuilder>{

  static Serializer<InsuranceCompany> get serializer => _$insuranceCompanySerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  String get website;

  @nullable
  String get phoneNumber;

  @nullable
  String get address;

  InsuranceCompany._();

  factory InsuranceCompany([void Function(InsuranceCompanyBuilder) updates]) = _$InsuranceCompany;
}