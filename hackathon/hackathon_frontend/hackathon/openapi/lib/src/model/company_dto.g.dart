// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompanyDTO extends CompanyDTO {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String location;

  factory _$CompanyDTO([void Function(CompanyDTOBuilder)? updates]) =>
      (new CompanyDTOBuilder()..update(updates))._build();

  _$CompanyDTO._({this.id, required this.name, required this.location})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CompanyDTO', 'name');
    BuiltValueNullFieldError.checkNotNull(location, r'CompanyDTO', 'location');
  }

  @override
  CompanyDTO rebuild(void Function(CompanyDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyDTOBuilder toBuilder() => new CompanyDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyDTO &&
        id == other.id &&
        name == other.name &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('location', location))
        .toString();
  }
}

class CompanyDTOBuilder implements Builder<CompanyDTO, CompanyDTOBuilder> {
  _$CompanyDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  CompanyDTOBuilder() {
    CompanyDTO._defaults(this);
  }

  CompanyDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyDTO;
  }

  @override
  void update(void Function(CompanyDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyDTO build() => _build();

  _$CompanyDTO _build() {
    final _$result = _$v ??
        new _$CompanyDTO._(
          id: id,
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CompanyDTO', 'name'),
          location: BuiltValueNullFieldError.checkNotNull(
              location, r'CompanyDTO', 'location'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
