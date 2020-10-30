library serializers;

import 'package:built_value/serializer.dart';
import 'json_parsing.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'model/insurance_company.dart';
import 'model/insurance_case.dart';
import 'model/insured_client.dart';

part 'serializers.g.dart';

@SerializersFor([
  Article,
  InsuranceCompany,
  InsuranceCase,
  InsuredClient,
])
final Serializers serializers = _$serializers;

Serializers standardSerializers =
(serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    standardSerializers.deserializeWith<T>(standardSerializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) =>
    BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));