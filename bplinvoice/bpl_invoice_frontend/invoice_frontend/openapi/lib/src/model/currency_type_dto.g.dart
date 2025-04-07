// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_type_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CurrencyTypeDTO extends CurrencyTypeDTO {
  @override
  final int? id;
  @override
  final String? name;

  factory _$CurrencyTypeDTO([void Function(CurrencyTypeDTOBuilder)? updates]) =>
      (new CurrencyTypeDTOBuilder()..update(updates))._build();

  _$CurrencyTypeDTO._({this.id, this.name}) : super._();

  @override
  CurrencyTypeDTO rebuild(void Function(CurrencyTypeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyTypeDTOBuilder toBuilder() =>
      new CurrencyTypeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrencyTypeDTO && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'CurrencyTypeDTO')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class CurrencyTypeDTOBuilder
    implements Builder<CurrencyTypeDTO, CurrencyTypeDTOBuilder> {
  _$CurrencyTypeDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CurrencyTypeDTOBuilder() {
    CurrencyTypeDTO._defaults(this);
  }

  CurrencyTypeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrencyTypeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrencyTypeDTO;
  }

  @override
  void update(void Function(CurrencyTypeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrencyTypeDTO build() => _build();

  _$CurrencyTypeDTO _build() {
    final _$result = _$v ??
        new _$CurrencyTypeDTO._(
          id: id,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
