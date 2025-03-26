// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ParentType extends ParentType {
  @override
  final int? id;
  @override
  final String typeLabel;

  factory _$ParentType([void Function(ParentTypeBuilder)? updates]) =>
      (new ParentTypeBuilder()..update(updates))._build();

  _$ParentType._({this.id, required this.typeLabel}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        typeLabel, r'ParentType', 'typeLabel');
  }

  @override
  ParentType rebuild(void Function(ParentTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentTypeBuilder toBuilder() => new ParentTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentType &&
        id == other.id &&
        typeLabel == other.typeLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, typeLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParentType')
          ..add('id', id)
          ..add('typeLabel', typeLabel))
        .toString();
  }
}

class ParentTypeBuilder implements Builder<ParentType, ParentTypeBuilder> {
  _$ParentType? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _typeLabel;
  String? get typeLabel => _$this._typeLabel;
  set typeLabel(String? typeLabel) => _$this._typeLabel = typeLabel;

  ParentTypeBuilder() {
    ParentType._defaults(this);
  }

  ParentTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _typeLabel = $v.typeLabel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParentType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParentType;
  }

  @override
  void update(void Function(ParentTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParentType build() => _build();

  _$ParentType _build() {
    final _$result = _$v ??
        new _$ParentType._(
          id: id,
          typeLabel: BuiltValueNullFieldError.checkNotNull(
              typeLabel, r'ParentType', 'typeLabel'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
