// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Organization extends Organization {
  @override
  final int? id;
  @override
  final String? externalId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? organizationType;
  @override
  final String? organizationGroup;

  factory _$Organization([void Function(OrganizationBuilder)? updates]) =>
      (new OrganizationBuilder()..update(updates))._build();

  _$Organization._(
      {this.id,
      this.externalId,
      required this.name,
      this.description,
      this.organizationType,
      this.organizationGroup})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Organization', 'name');
  }

  @override
  Organization rebuild(void Function(OrganizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationBuilder toBuilder() => new OrganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organization &&
        id == other.id &&
        externalId == other.externalId &&
        name == other.name &&
        description == other.description &&
        organizationType == other.organizationType &&
        organizationGroup == other.organizationGroup;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, externalId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, organizationType.hashCode);
    _$hash = $jc(_$hash, organizationGroup.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Organization')
          ..add('id', id)
          ..add('externalId', externalId)
          ..add('name', name)
          ..add('description', description)
          ..add('organizationType', organizationType)
          ..add('organizationGroup', organizationGroup))
        .toString();
  }
}

class OrganizationBuilder
    implements Builder<Organization, OrganizationBuilder> {
  _$Organization? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _externalId;
  String? get externalId => _$this._externalId;
  set externalId(String? externalId) => _$this._externalId = externalId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _organizationType;
  String? get organizationType => _$this._organizationType;
  set organizationType(String? organizationType) =>
      _$this._organizationType = organizationType;

  String? _organizationGroup;
  String? get organizationGroup => _$this._organizationGroup;
  set organizationGroup(String? organizationGroup) =>
      _$this._organizationGroup = organizationGroup;

  OrganizationBuilder() {
    Organization._defaults(this);
  }

  OrganizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _externalId = $v.externalId;
      _name = $v.name;
      _description = $v.description;
      _organizationType = $v.organizationType;
      _organizationGroup = $v.organizationGroup;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Organization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Organization;
  }

  @override
  void update(void Function(OrganizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Organization build() => _build();

  _$Organization _build() {
    final _$result = _$v ??
        new _$Organization._(
          id: id,
          externalId: externalId,
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'Organization', 'name'),
          description: description,
          organizationType: organizationType,
          organizationGroup: organizationGroup,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
