library serializers;

import 'package:built_value/serializer.dart';
import 'package:hello_world_flutter/src/model/insurance_company.dart';
import 'json_parsing.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor([
  Article,
  InsuranceCompany,
])
final Serializers serializers = _$serializers;

Serializers standardSerializers =
(serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();