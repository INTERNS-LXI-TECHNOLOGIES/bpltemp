// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parentorganization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Parentorganization extends Parentorganization {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;

  factory _$Parentorganization(
          [void Function(ParentorganizationBuilder)? updates]) =>
      (new ParentorganizationBuilder()..update(updates))._build();

  _$Parentorganization._({this.id, this.name, this.description}) : super._();

  @override
  Parentorganization rebuild(
          void Function(ParentorganizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentorganizationBuilder toBuilder() =>
      new ParentorganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Parentorganization &&
        id == other.id &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Parentorganization')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class ParentorganizationBuilder
    implements Builder<Parentorganization, ParentorganizationBuilder> {
  _$Parentorganization? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ParentorganizationBuilder() {
    Parentorganization._defaults(this);
  }

  ParentorganizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Parentorganization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Parentorganization;
  }

  @override
  void update(void Function(ParentorganizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Parentorganization build() => _build();

  _$Parentorganization _build() {
    final _$result = _$v ??
        new _$Parentorganization._(
          id: id,
          name: name,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
