// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insured_vehicle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InsuredVehicle> _$insuredVehicleSerializer =
    new _$InsuredVehicleSerializer();

class _$InsuredVehicleSerializer
    implements StructuredSerializer<InsuredVehicle> {
  @override
  final Iterable<Type> types = const [InsuredVehicle, _$InsuredVehicle];
  @override
  final String wireName = 'InsuredVehicle';

  @override
  Iterable<Object> serialize(Serializers serializers, InsuredVehicle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.vin != null) {
      result
        ..add('vin')
        ..add(serializers.serialize(object.vin,
            specifiedType: const FullType(String)));
    }
    if (object.make != null) {
      result
        ..add('make')
        ..add(serializers.serialize(object.make,
            specifiedType: const FullType(String)));
    }
    if (object.model != null) {
      result
        ..add('model')
        ..add(serializers.serialize(object.model,
            specifiedType: const FullType(String)));
    }
    if (object.year != null) {
      result
        ..add('year')
        ..add(serializers.serialize(object.year,
            specifiedType: const FullType(int)));
    }
    if (object.color != null) {
      result
        ..add('color')
        ..add(serializers.serialize(object.color,
            specifiedType: const FullType(String)));
    }
    if (object.licensePlate != null) {
      result
        ..add('licensePlate')
        ..add(serializers.serialize(object.licensePlate,
            specifiedType: const FullType(String)));
    }
    if (object.insuredClient != null) {
      result
        ..add('insuredClient')
        ..add(serializers.serialize(object.insuredClient,
            specifiedType: const FullType(InsuredClient)));
    }
    return result;
  }

  @override
  InsuredVehicle deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InsuredVehicleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vin':
          result.vin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'make':
          result.make = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'insuredClient':
          result.insuredClient.replace(serializers.deserialize(value,
              specifiedType: const FullType(InsuredClient)) as InsuredClient);
          break;
      }
    }

    return result.build();
  }
}

class _$InsuredVehicle extends InsuredVehicle {
  @override
  final String vin;
  @override
  final String make;
  @override
  final String model;
  @override
  final int year;
  @override
  final String color;
  @override
  final String licensePlate;
  @override
  final InsuredClient insuredClient;

  factory _$InsuredVehicle([void Function(InsuredVehicleBuilder) updates]) =>
      (new InsuredVehicleBuilder()..update(updates)).build();

  _$InsuredVehicle._(
      {this.vin,
      this.make,
      this.model,
      this.year,
      this.color,
      this.licensePlate,
      this.insuredClient})
      : super._();

  @override
  InsuredVehicle rebuild(void Function(InsuredVehicleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InsuredVehicleBuilder toBuilder() =>
      new InsuredVehicleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuredVehicle &&
        vin == other.vin &&
        make == other.make &&
        model == other.model &&
        year == other.year &&
        color == other.color &&
        licensePlate == other.licensePlate &&
        insuredClient == other.insuredClient;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, vin.hashCode), make.hashCode),
                        model.hashCode),
                    year.hashCode),
                color.hashCode),
            licensePlate.hashCode),
        insuredClient.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InsuredVehicle')
          ..add('vin', vin)
          ..add('make', make)
          ..add('model', model)
          ..add('year', year)
          ..add('color', color)
          ..add('licensePlate', licensePlate)
          ..add('insuredClient', insuredClient))
        .toString();
  }
}

class InsuredVehicleBuilder
    implements Builder<InsuredVehicle, InsuredVehicleBuilder> {
  _$InsuredVehicle _$v;

  String _vin;
  String get vin => _$this._vin;
  set vin(String vin) => _$this._vin = vin;

  String _make;
  String get make => _$this._make;
  set make(String make) => _$this._make = make;

  String _model;
  String get model => _$this._model;
  set model(String model) => _$this._model = model;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  String _licensePlate;
  String get licensePlate => _$this._licensePlate;
  set licensePlate(String licensePlate) => _$this._licensePlate = licensePlate;

  InsuredClientBuilder _insuredClient;
  InsuredClientBuilder get insuredClient =>
      _$this._insuredClient ??= new InsuredClientBuilder();
  set insuredClient(InsuredClientBuilder insuredClient) =>
      _$this._insuredClient = insuredClient;

  InsuredVehicleBuilder();

  InsuredVehicleBuilder get _$this {
    if (_$v != null) {
      _vin = _$v.vin;
      _make = _$v.make;
      _model = _$v.model;
      _year = _$v.year;
      _color = _$v.color;
      _licensePlate = _$v.licensePlate;
      _insuredClient = _$v.insuredClient?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InsuredVehicle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InsuredVehicle;
  }

  @override
  void update(void Function(InsuredVehicleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InsuredVehicle build() {
    _$InsuredVehicle _$result;
    try {
      _$result = _$v ??
          new _$InsuredVehicle._(
              vin: vin,
              make: make,
              model: model,
              year: year,
              color: color,
              licensePlate: licensePlate,
              insuredClient: _insuredClient?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'insuredClient';
        _insuredClient?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InsuredVehicle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
