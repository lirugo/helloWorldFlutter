// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_case.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InsuranceCase> _$insuranceCaseSerializer =
    new _$InsuranceCaseSerializer();

class _$InsuranceCaseSerializer implements StructuredSerializer<InsuranceCase> {
  @override
  final Iterable<Type> types = const [InsuranceCase, _$InsuranceCase];
  @override
  final String wireName = 'InsuranceCase';

  @override
  Iterable<Object> serialize(Serializers serializers, InsuranceCase object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
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
  InsuranceCase deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InsuranceCaseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
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

class _$InsuranceCase extends InsuranceCase {
  @override
  final String id;
  @override
  final InsuredClient insuredClient;

  factory _$InsuranceCase([void Function(InsuranceCaseBuilder) updates]) =>
      (new InsuranceCaseBuilder()..update(updates)).build();

  _$InsuranceCase._({this.id, this.insuredClient}) : super._();

  @override
  InsuranceCase rebuild(void Function(InsuranceCaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InsuranceCaseBuilder toBuilder() => new InsuranceCaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuranceCase &&
        id == other.id &&
        insuredClient == other.insuredClient;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), insuredClient.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InsuranceCase')
          ..add('id', id)
          ..add('insuredClient', insuredClient))
        .toString();
  }
}

class InsuranceCaseBuilder
    implements Builder<InsuranceCase, InsuranceCaseBuilder> {
  _$InsuranceCase _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  InsuredClientBuilder _insuredClient;
  InsuredClientBuilder get insuredClient =>
      _$this._insuredClient ??= new InsuredClientBuilder();
  set insuredClient(InsuredClientBuilder insuredClient) =>
      _$this._insuredClient = insuredClient;

  InsuranceCaseBuilder();

  InsuranceCaseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _insuredClient = _$v.insuredClient?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InsuranceCase other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InsuranceCase;
  }

  @override
  void update(void Function(InsuranceCaseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InsuranceCase build() {
    _$InsuranceCase _$result;
    try {
      _$result = _$v ??
          new _$InsuranceCase._(id: id, insuredClient: _insuredClient?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'insuredClient';
        _insuredClient?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InsuranceCase', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
