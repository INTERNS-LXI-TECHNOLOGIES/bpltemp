// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmployeeDTO extends EmployeeDTO {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String position;
  @override
  final String email;
  @override
  final CompanyDTO? company;

  factory _$EmployeeDTO([void Function(EmployeeDTOBuilder)? updates]) =>
      (new EmployeeDTOBuilder()..update(updates))._build();

  _$EmployeeDTO._(
      {this.id,
      required this.name,
      required this.position,
      required this.email,
      this.company})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'EmployeeDTO', 'name');
    BuiltValueNullFieldError.checkNotNull(position, r'EmployeeDTO', 'position');
    BuiltValueNullFieldError.checkNotNull(email, r'EmployeeDTO', 'email');
  }

  @override
  EmployeeDTO rebuild(void Function(EmployeeDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeDTOBuilder toBuilder() => new EmployeeDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmployeeDTO &&
        id == other.id &&
        name == other.name &&
        position == other.position &&
        email == other.email &&
        company == other.company;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmployeeDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('position', position)
          ..add('email', email)
          ..add('company', company))
        .toString();
  }
}

class EmployeeDTOBuilder implements Builder<EmployeeDTO, EmployeeDTOBuilder> {
  _$EmployeeDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CompanyDTOBuilder? _company;
  CompanyDTOBuilder get company => _$this._company ??= new CompanyDTOBuilder();
  set company(CompanyDTOBuilder? company) => _$this._company = company;

  EmployeeDTOBuilder() {
    EmployeeDTO._defaults(this);
  }

  EmployeeDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _position = $v.position;
      _email = $v.email;
      _company = $v.company?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmployeeDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmployeeDTO;
  }

  @override
  void update(void Function(EmployeeDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmployeeDTO build() => _build();

  _$EmployeeDTO _build() {
    _$EmployeeDTO _$result;
    try {
      _$result = _$v ??
          new _$EmployeeDTO._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'EmployeeDTO', 'name'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'EmployeeDTO', 'position'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'EmployeeDTO', 'email'),
            company: _company?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'company';
        _company?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EmployeeDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
