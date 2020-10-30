import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hello_world_flutter/src/model/insurance_case_info.dart';

import 'insured_client.dart';

part 'insured_vehicle.g.dart';

abstract class InsuredVehicle implements Built<InsuredVehicle, InsuredVehicleBuilder>{

  static Serializer<InsuredVehicle> get serializer => _$insuredVehicleSerializer;

  @nullable
  String get vin;

  @nullable
  String get make;

  @nullable
  String get model;

  @nullable
  int get year;

  @nullable
  String get color;

  @nullable
  String get licensePlate;

  @nullable
  InsuredClient get insuredClient;

  InsuredVehicle._();

  factory InsuredVehicle([void Function(InsuredVehicleBuilder) updates]) = _$InsuredVehicle;
}