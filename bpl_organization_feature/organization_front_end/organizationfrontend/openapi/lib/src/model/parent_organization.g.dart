// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_organization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ParentOrganization extends ParentOrganization {
  @override
  final int? id;
  @override
  final String name;
  @override
  final Organization? organization;

  factory _$ParentOrganization(
          [void Function(ParentOrganizationBuilder)? updates]) =>
      (new ParentOrganizationBuilder()..update(updates))._build();

  _$ParentOrganization._({this.id, required this.name, this.organization})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ParentOrganization', 'name');
  }

  @override
  ParentOrganization rebuild(
          void Function(ParentOrganizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentOrganizationBuilder toBuilder() =>
      new ParentOrganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentOrganization &&
        id == other.id &&
        name == other.name &&
        organization == other.organization;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, organization.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParentOrganization')
          ..add('id', id)
          ..add('name', name)
          ..add('organization', organization))
        .toString();
  }
}

class ParentOrganizationBuilder
    implements Builder<ParentOrganization, ParentOrganizationBuilder> {
  _$ParentOrganization? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  OrganizationBuilder? _organization;
  OrganizationBuilder get organization =>
      _$this._organization ??= new OrganizationBuilder();
  set organization(OrganizationBuilder? organization) =>
      _$this._organization = organization;

  ParentOrganizationBuilder() {
    ParentOrganization._defaults(this);
  }

  ParentOrganizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _organization = $v.organization?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParentOrganization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParentOrganization;
  }

  @override
  void update(void Function(ParentOrganizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParentOrganization build() => _build();

  _$ParentOrganization _build() {
    _$ParentOrganization _$result;
    try {
      _$result = _$v ??
          new _$ParentOrganization._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ParentOrganization', 'name'),
            organization: _organization?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organization';
        _organization?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ParentOrganization', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
