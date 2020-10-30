// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_case_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InsuranceCaseInfo> _$insuranceCaseInfoSerializer =
    new _$InsuranceCaseInfoSerializer();

class _$InsuranceCaseInfoSerializer
    implements StructuredSerializer<InsuranceCaseInfo> {
  @override
  final Iterable<Type> types = const [InsuranceCaseInfo, _$InsuranceCaseInfo];
  @override
  final String wireName = 'InsuranceCaseInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, InsuranceCaseInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.expertRequest != null) {
      result
        ..add('expertRequest')
        ..add(serializers.serialize(object.expertRequest,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
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
  InsuranceCaseInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InsuranceCaseInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expertRequest':
          result.expertRequest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
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

class _$InsuranceCaseInfo extends InsuranceCaseInfo {
  @override
  final String status;
  @override
  final String expertRequest;
  @override
  final String title;
  @override
  final String address;

  factory _$InsuranceCaseInfo(
          [void Function(InsuranceCaseInfoBuilder) updates]) =>
      (new InsuranceCaseInfoBuilder()..update(updates)).build();

  _$InsuranceCaseInfo._(
      {this.status, this.expertRequest, this.title, this.address})
      : super._();

  @override
  InsuranceCaseInfo rebuild(void Function(InsuranceCaseInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InsuranceCaseInfoBuilder toBuilder() =>
      new InsuranceCaseInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuranceCaseInfo &&
        status == other.status &&
        expertRequest == other.expertRequest &&
        title == other.title &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, status.hashCode), expertRequest.hashCode),
            title.hashCode),
        address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InsuranceCaseInfo')
          ..add('status', status)
          ..add('expertRequest', expertRequest)
          ..add('title', title)
          ..add('address', address))
        .toString();
  }
}

class InsuranceCaseInfoBuilder
    implements Builder<InsuranceCaseInfo, InsuranceCaseInfoBuilder> {
  _$InsuranceCaseInfo _$v;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _expertRequest;
  String get expertRequest => _$this._expertRequest;
  set expertRequest(String expertRequest) =>
      _$this._expertRequest = expertRequest;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  InsuranceCaseInfoBuilder();

  InsuranceCaseInfoBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _expertRequest = _$v.expertRequest;
      _title = _$v.title;
      _address = _$v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InsuranceCaseInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InsuranceCaseInfo;
  }

  @override
  void update(void Function(InsuranceCaseInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InsuranceCaseInfo build() {
    final _$result = _$v ??
        new _$InsuranceCaseInfo._(
            status: status,
            expertRequest: expertRequest,
            title: title,
            address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
