// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insured_client.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InsuredClient> _$insuredClientSerializer =
    new _$InsuredClientSerializer();

class _$InsuredClientSerializer implements StructuredSerializer<InsuredClient> {
  @override
  final Iterable<Type> types = const [InsuredClient, _$InsuredClient];
  @override
  final String wireName = 'InsuredClient';

  @override
  Iterable<Object> serialize(Serializers serializers, InsuredClient object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.firstName != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.middleName != null) {
      result
        ..add('middleName')
        ..add(serializers.serialize(object.middleName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InsuredClient deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InsuredClientBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'middleName':
          result.middleName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InsuredClient extends InsuredClient {
  @override
  final String firstName;
  @override
  final String middleName;
  @override
  final String lastName;
  @override
  final String phoneNumber;

  factory _$InsuredClient([void Function(InsuredClientBuilder) updates]) =>
      (new InsuredClientBuilder()..update(updates)).build();

  _$InsuredClient._(
      {this.firstName, this.middleName, this.lastName, this.phoneNumber})
      : super._();

  @override
  InsuredClient rebuild(void Function(InsuredClientBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InsuredClientBuilder toBuilder() => new InsuredClientBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuredClient &&
        firstName == other.firstName &&
        middleName == other.middleName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, firstName.hashCode), middleName.hashCode),
            lastName.hashCode),
        phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InsuredClient')
          ..add('firstName', firstName)
          ..add('middleName', middleName)
          ..add('lastName', lastName)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class InsuredClientBuilder
    implements Builder<InsuredClient, InsuredClientBuilder> {
  _$InsuredClient _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _middleName;
  String get middleName => _$this._middleName;
  set middleName(String middleName) => _$this._middleName = middleName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  InsuredClientBuilder();

  InsuredClientBuilder get _$this {
    if (_$v != null) {
      _firstName = _$v.firstName;
      _middleName = _$v.middleName;
      _lastName = _$v.lastName;
      _phoneNumber = _$v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InsuredClient other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InsuredClient;
  }

  @override
  void update(void Function(InsuredClientBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InsuredClient build() {
    final _$result = _$v ??
        new _$InsuredClient._(
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            phoneNumber: phoneNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
