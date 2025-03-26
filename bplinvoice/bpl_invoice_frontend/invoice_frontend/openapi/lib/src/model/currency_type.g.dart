// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CurrencyType extends CurrencyType {
  @override
  final int? id;
  @override
  final String? name;

  factory _$CurrencyType([void Function(CurrencyTypeBuilder)? updates]) =>
      (new CurrencyTypeBuilder()..update(updates))._build();

  _$CurrencyType._({this.id, this.name}) : super._();

  @override
  CurrencyType rebuild(void Function(CurrencyTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyTypeBuilder toBuilder() => new CurrencyTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrencyType && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CurrencyType')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class CurrencyTypeBuilder
    implements Builder<CurrencyType, CurrencyTypeBuilder> {
  _$CurrencyType? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CurrencyTypeBuilder() {
    CurrencyType._defaults(this);
  }

  CurrencyTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrencyType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrencyType;
  }

  @override
  void update(void Function(CurrencyTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrencyType build() => _build();

  _$CurrencyType _build() {
    final _$result = _$v ??
        new _$CurrencyType._(
          id: id,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
