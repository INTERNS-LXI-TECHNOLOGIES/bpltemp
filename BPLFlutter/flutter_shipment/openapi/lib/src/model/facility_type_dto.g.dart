// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_type_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FacilityTypeDTO extends FacilityTypeDTO {
  @override
  final int? id;
  @override
  final String name;

  factory _$FacilityTypeDTO([void Function(FacilityTypeDTOBuilder)? updates]) =>
      (new FacilityTypeDTOBuilder()..update(updates))._build();

  _$FacilityTypeDTO._({this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'FacilityTypeDTO', 'name');
  }

  @override
  FacilityTypeDTO rebuild(void Function(FacilityTypeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FacilityTypeDTOBuilder toBuilder() =>
      new FacilityTypeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FacilityTypeDTO && id == other.id && name == other.name;
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
    return (newBuiltValueToStringHelper(r'FacilityTypeDTO')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class FacilityTypeDTOBuilder
    implements Builder<FacilityTypeDTO, FacilityTypeDTOBuilder> {
  _$FacilityTypeDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FacilityTypeDTOBuilder() {
    FacilityTypeDTO._defaults(this);
  }

  FacilityTypeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FacilityTypeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FacilityTypeDTO;
  }

  @override
  void update(void Function(FacilityTypeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FacilityTypeDTO build() => _build();

  _$FacilityTypeDTO _build() {
    final _$result = _$v ??
        new _$FacilityTypeDTO._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'FacilityTypeDTO', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
