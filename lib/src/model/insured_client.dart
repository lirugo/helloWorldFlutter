import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'insured_client.dart';

part 'insured_client.g.dart';

abstract class InsuredClient implements Built<InsuredClient, InsuredClientBuilder>{

  static Serializer<InsuredClient> get serializer => _$insuredClientSerializer;

  @nullable
  String get firstName;

  @nullable
  String get middleName;

  @nullable
  String get lastName;

  @nullable
  String get phoneNumber;

  InsuredClient._();

  factory InsuredClient([void Function(InsuredClientBuilder) updates]) = _$InsuredClient;
}