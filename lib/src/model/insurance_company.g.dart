// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_company.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InsuranceCompany> _$insuranceCompanySerializer =
    new _$InsuranceCompanySerializer();

class _$InsuranceCompanySerializer
    implements StructuredSerializer<InsuranceCompany> {
  @override
  final Iterable<Type> types = const [InsuranceCompany, _$InsuranceCompany];
  @override
  final String wireName = 'InsuranceCompany';

  @override
  Iterable<Object> serialize(Serializers serializers, InsuranceCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.website != null) {
      result
        ..add('website')
        ..add(serializers.serialize(object.website,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InsuranceCompany deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InsuranceCompanyBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InsuranceCompany extends InsuranceCompany {
  @override
  final String id;
  @override
  final String name;
  @override
  final String website;
  @override
  final String phoneNumber;
  @override
  final String address;

  factory _$InsuranceCompany(
          [void Function(InsuranceCompanyBuilder) updates]) =>
      (new InsuranceCompanyBuilder()..update(updates)).build();

  _$InsuranceCompany._(
      {this.id, this.name, this.website, this.phoneNumber, this.address})
      : super._();

  @override
  InsuranceCompany rebuild(void Function(InsuranceCompanyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InsuranceCompanyBuilder toBuilder() =>
      new InsuranceCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuranceCompany &&
        id == other.id &&
        name == other.name &&
        website == other.website &&
        phoneNumber == other.phoneNumber &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), website.hashCode),
            phoneNumber.hashCode),
        address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InsuranceCompany')
          ..add('id', id)
          ..add('name', name)
          ..add('website', website)
          ..add('phoneNumber', phoneNumber)
          ..add('address', address))
        .toString();
  }
}

class InsuranceCompanyBuilder
    implements Builder<InsuranceCompany, InsuranceCompanyBuilder> {
  _$InsuranceCompany _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _website;
  String get website => _$this._website;
  set website(String website) => _$this._website = website;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  InsuranceCompanyBuilder();

  InsuranceCompanyBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _website = _$v.website;
      _phoneNumber = _$v.phoneNumber;
      _address = _$v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InsuranceCompany other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InsuranceCompany;
  }

  @override
  void update(void Function(InsuranceCompanyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InsuranceCompany build() {
    final _$result = _$v ??
        new _$InsuranceCompany._(
            id: id,
            name: name,
            website: website,
            phoneNumber: phoneNumber,
            address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
