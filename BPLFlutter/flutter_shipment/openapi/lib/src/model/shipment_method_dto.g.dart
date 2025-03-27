// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_method_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentMethodDTO extends ShipmentMethodDTO {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final FacilityTypeDTO? parentType;

  factory _$ShipmentMethodDTO(
          [void Function(ShipmentMethodDTOBuilder)? updates]) =>
      (new ShipmentMethodDTOBuilder()..update(updates))._build();

  _$ShipmentMethodDTO._(
      {this.id, required this.name, this.description, this.parentType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ShipmentMethodDTO', 'name');
  }

  @override
  ShipmentMethodDTO rebuild(void Function(ShipmentMethodDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentMethodDTOBuilder toBuilder() =>
      new ShipmentMethodDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentMethodDTO &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        parentType == other.parentType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, parentType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentMethodDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('parentType', parentType))
        .toString();
  }
}

class ShipmentMethodDTOBuilder
    implements Builder<ShipmentMethodDTO, ShipmentMethodDTOBuilder> {
  _$ShipmentMethodDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  FacilityTypeDTOBuilder? _parentType;
  FacilityTypeDTOBuilder get parentType =>
      _$this._parentType ??= new FacilityTypeDTOBuilder();
  set parentType(FacilityTypeDTOBuilder? parentType) =>
      _$this._parentType = parentType;

  ShipmentMethodDTOBuilder() {
    ShipmentMethodDTO._defaults(this);
  }

  ShipmentMethodDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _parentType = $v.parentType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentMethodDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentMethodDTO;
  }

  @override
  void update(void Function(ShipmentMethodDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentMethodDTO build() => _build();

  _$ShipmentMethodDTO _build() {
    _$ShipmentMethodDTO _$result;
    try {
      _$result = _$v ??
          new _$ShipmentMethodDTO._(
              id: id,
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ShipmentMethodDTO', 'name'),
              description: description,
              parentType: _parentType?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parentType';
        _parentType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShipmentMethodDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
