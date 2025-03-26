// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShipmentType extends ShipmentType {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String lookupName;
  @override
  final ParentType? parentType;

  factory _$ShipmentType([void Function(ShipmentTypeBuilder)? updates]) =>
      (new ShipmentTypeBuilder()..update(updates))._build();

  _$ShipmentType._(
      {this.id, required this.name, required this.lookupName, this.parentType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ShipmentType', 'name');
    BuiltValueNullFieldError.checkNotNull(
        lookupName, r'ShipmentType', 'lookupName');
  }

  @override
  ShipmentType rebuild(void Function(ShipmentTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShipmentTypeBuilder toBuilder() => new ShipmentTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShipmentType &&
        id == other.id &&
        name == other.name &&
        lookupName == other.lookupName &&
        parentType == other.parentType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, lookupName.hashCode);
    _$hash = $jc(_$hash, parentType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShipmentType')
          ..add('id', id)
          ..add('name', name)
          ..add('lookupName', lookupName)
          ..add('parentType', parentType))
        .toString();
  }
}

class ShipmentTypeBuilder
    implements Builder<ShipmentType, ShipmentTypeBuilder> {
  _$ShipmentType? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _lookupName;
  String? get lookupName => _$this._lookupName;
  set lookupName(String? lookupName) => _$this._lookupName = lookupName;

  ParentTypeBuilder? _parentType;
  ParentTypeBuilder get parentType =>
      _$this._parentType ??= new ParentTypeBuilder();
  set parentType(ParentTypeBuilder? parentType) =>
      _$this._parentType = parentType;

  ShipmentTypeBuilder() {
    ShipmentType._defaults(this);
  }

  ShipmentTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _lookupName = $v.lookupName;
      _parentType = $v.parentType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShipmentType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShipmentType;
  }

  @override
  void update(void Function(ShipmentTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShipmentType build() => _build();

  _$ShipmentType _build() {
    _$ShipmentType _$result;
    try {
      _$result = _$v ??
          new _$ShipmentType._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ShipmentType', 'name'),
            lookupName: BuiltValueNullFieldError.checkNotNull(
                lookupName, r'ShipmentType', 'lookupName'),
            parentType: _parentType?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parentType';
        _parentType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShipmentType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
